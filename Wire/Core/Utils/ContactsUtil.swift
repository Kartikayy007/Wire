//
//  ContactsUtil.swift
//  Wire
//
//  Created by kartikay on 27/03/26.
//

import Combine
import Contacts
import SwiftData
import UIKit

class ContactsUtil: ObservableObject {
    let store = CNContactStore()

    func reqAccess(completion: @escaping (Bool) -> Void) {
        store.requestAccess(for: .contacts) { granted, error in
            completion(granted)
        }
    }

    func fetchContacts(context: ModelContext) {
        var contactsList = [CNContact]()
        let keys =
            [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
            as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: keys)

        do {
            try store.enumerateContacts(with: request) { contacts, _ in
                contactsList.append(contacts)

                let newContact = ContactModel(
                    id: contacts.identifier,
                    givenName: contacts.givenName,
                    familyName: contacts.familyName,
                    phoneNumbers: contacts.phoneNumbers.map { $0.value.stringValue }
                )

                context.insert(newContact)
            }
        } catch {
            print("Failed to fetch contacts: \(error)")
        }
    }
}
