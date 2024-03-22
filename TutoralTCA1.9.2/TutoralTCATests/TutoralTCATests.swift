//
//  TutoralTCATests.swift
//  TutoralTCATests
//
//  Created by phang on 3/13/24.
//

import XCTest

import ComposableArchitecture

@testable import TutoralTCA

@MainActor
final class TutoralTCATests: XCTestCase {
    
    // MARK: - CounterFeature
    
    // 숫자 증가 / 감소 버튼 테스트
    func testCounter() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }
        
        await store.send(.incrementButtonTapped) {
            $0.count = 1
        }
        await store.send(.decrementButtonTapped) {
            $0.count = 0
        }
    }
    
    // 타이머 테스트
    func testTimer() async {
        let clock = TestClock()
        
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        } withDependencies: {
            $0.continuousClock = clock
        }
        
        await store.send(.toggleTimerButtonTapped) {
            $0.isTimerRunning = true
        }
        await clock.advance(by: .seconds(1))
        await store.receive(\.timerTick) {
            $0.count = 1
        }
        await store.send(.toggleTimerButtonTapped) {
            $0.isTimerRunning = false
        }
    }
    
    // 숫자 String API 테스트
    func testNumberFact() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        } withDependencies: {
            $0.numberFact.fetch = { "\($0) is a good number." }
        }
        
        await store.send(.factButtonTapped) {
            $0.isLoading = true
        }
        await store.receive(\.factResponse) {
            $0.isLoading = false
            $0.fact = "0 is a good number."
        }
    }
    
    // MARK: - AppFeature
    
    // 다른 탭뷰의 숫자 증가 테스트
    func testIncrementInFirstTab() async {
        let store = TestStore(initialState: AppFeature.State()) {
            AppFeature()
        }
        
        await store.send(\.tab1.incrementButtonTapped) {
            $0.tab1.count = 1
        }
    }
    
    // MARK: - ContactsFeature
    
    // contact 추가 및 저장 테스트 ver.1
    func testAddFlow() async {
        let store = TestStore(initialState: ContactsFeature.State()) {
            ContactsFeature()
        } withDependencies: {
            $0.uuid = .incrementing
        }
        await store.send(.addButtonTapped) {
            $0.destination = .addContact(
                AddContactFeature.State(
                    contact: Contact(id: UUID(0), name: "")
                )
            )
        }
        await store.send(\.destination.addContact.setName, "Phang Jr.") {
            $0.destination?.addContact?.contact.name = "Phang Jr."
        }
        await store.send(\.destination.addContact.saveButtonTapped)
        await store.receive(
            \.destination.addContact.delegate.saveContact,
             Contact(id: UUID(0), name: "Phang Jr.")
        ) {
            $0.contacts = [
                Contact(id: UUID(0), name: "Phang Jr.")
            ]
        }
        await store.receive(\.destination.dismiss) {
            $0.destination = nil
        }
    }
    
    // contact 추가 및 저장 테스트 ver.2
    func testAddFlow_NonExhaustive() async {
        let store = TestStore(initialState: ContactsFeature.State()) {
            ContactsFeature()
        } withDependencies: {
            $0.uuid = .incrementing
        }
        store.exhaustivity = .off
        await store.send(.addButtonTapped)
        await store.send(\.destination.addContact.setName, "Phang Jr.")
        await store.send(\.destination.addContact.saveButtonTapped)
        await store.skipReceivedActions()
        store.assert {
            $0.contacts = [
                Contact(id: UUID(0), name: "Phang Jr.")
            ]
            $0.destination = nil
        }
    }
    
    // contact 삭제 테스트
    func testDeleteContact() async {
        let store = TestStore(initialState: ContactsFeature.State(
            contacts: [
                Contact(id: UUID(0), name: "Phang"),
                Contact(id: UUID(1), name: "Phang Jr.")
            ]
            )
        ) {
            ContactsFeature()
        }
        await store.send(.deleteButtonTapped(id: UUID(1))) {
            $0.destination = .alert(.deleteConfirmation(id: UUID(1)))
        }
        await store.send(.destination(.presented(.alert(.confirmDeletion(id: UUID(1)))))) {
            $0.contacts.remove(id: UUID(1))
            $0.destination = nil
        }
        store.assert {
            $0.contacts = [
                Contact(id: UUID(0), name: "Phang")
            ]
        }
    }
}
