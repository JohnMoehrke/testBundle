// equivalent to MHD Provide Document Bundle transaction
Profile:        ProvideTestBundle
Parent:         Bundle
* type = #transaction
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry and entry.resource MS
* entry contains 
    List 1..1 and
    DocumentRefs 0..* and
    Documents 0..* and
    Patient 0..1
* entry[List].resource only ListX
* entry[List] ^short = "the List"
* entry[List] ^definition = "The List defines who submitted it, why they submitted it, when they submitted, what is in it, and where it is destine."
* entry[List].resource 1..1
* entry[List].request 1..1
* entry[List].request.method = #POST
* entry[DocumentRefs].resource only DocumentReferenceX
* entry[DocumentRefs] ^short = "the DocumentReference resources"
* entry[DocumentRefs] ^definition = "any and all DocumentReference that are part of the SubmissionSet. These might be new, replacements, or other associations"
* entry[DocumentRefs].resource 1..1
* entry[DocumentRefs].request 1..1
* entry[DocumentRefs].request.method = #POST
* entry[Documents].resource ^type.code = "Binary"
* entry[Documents].resource ^type.profile = Canonical(Binary)
* entry[Documents] ^short = "the documents"
* entry[Documents] ^definition = "the documents referenced by the DocumentReference resources"
* entry[Documents].resource 1..1
* entry[Documents].request 1..1
* entry[Documents].request.method = #POST
* entry[Patient].resource ^type.code = "Patient"
* entry[Patient].resource ^type.profile = Canonical(Patient)
* entry[Patient] ^short = "the Patient"
* entry[Patient] ^definition = "the Patient"
* entry[Patient].resource 1..1
* entry[Patient].request.method = #POST

Profile: ListX
Parent: List
* status = #current

Instance: aaaaaaaa-bbbb-cccc-dddd-e00000000002
InstanceOf: ListX
Title: "Dummy List example"
Usage: #inline
* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> hello world </div>"
* status = #current
* mode = #working
* subject = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003)
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000001)
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003)

Profile: DocumentReferenceX
Parent: DocumentReference
* status = #current
* author ^type.aggregation = #contained
 
Instance: aaaaaaaa-bbbb-cccc-dddd-e00000000001
InstanceOf: DocumentReferenceX
Title: "Dummy DocumentReference example"
Usage: #inline
* status = #current
* subject = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003)
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain
* contained[0] = in-practitioner
* author = Reference(in-practitioner)


Instance: in-practitioner
InstanceOf: Practitioner
Title: "Intended Practitioner Recipient example"
Description: "a Practitioner identified only as an email address, carried as a contained resoruce."
Usage: #inline
* telecom.system = #email
* telecom.value = "JohnMoehrke@gmail.com"

Instance: aaaaaaaa-bbbb-cccc-dddd-e00000000003
InstanceOf: Patient
Title: "Bundled Dummy Patient"
Usage: #inline
* name[+].family = "Schmidt"
* name[=].given = "Dumb"

Instance:   ex-dummyProvideDocumentBundle
InstanceOf: Bundle
Title:      "Dummy Provide Document Bundle"
Usage: #example
* type = #transaction
* timestamp = 2020-11-24T23:50:50-05:00
* entry[+].resource =          aaaaaaaa-bbbb-cccc-dddd-e00000000003
* entry[=].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003"
* entry[=].request.url = "Patient"
* entry[=].request.method = #POST
* entry[+].resource =          aaaaaaaa-bbbb-cccc-dddd-e00000000001
* entry[=].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000001"
* entry[=].request.url = "List"
* entry[=].request.method = #POST
* entry[+].resource =          aaaaaaaa-bbbb-cccc-dddd-e00000000002
* entry[=].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000002"
* entry[=].request.url = "DocumentReference"
* entry[=].request.method = #POST

