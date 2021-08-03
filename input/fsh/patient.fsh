

Instance: aaaaaaaa-bbbb-cccc-dddd-e00000000002
InstanceOf: List
Title: "Dummy List example"
Usage: #inline
* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> hello world </div>"
* status = #current
* mode = #working
* subject = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003)
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000001)
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003)

Instance: aaaaaaaa-bbbb-cccc-dddd-e00000000001
InstanceOf: DocumentReference
Title: "Dummy DocumentReference example"
Usage: #inline
* status = #current
* subject = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003)
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain

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

