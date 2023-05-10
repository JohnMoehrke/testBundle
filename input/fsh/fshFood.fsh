// equivalent to MHD Provide Document Bundle transaction
Profile:        BundleX
Parent:         Bundle
Title: "Bundle X"
Description: "Bundle with some profiling"
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
Title: "List X profile"
Description: "List with some profiling"
* status = #current

Instance: aaaaaaaa-bbbb-cccc-dddd-e00000000002
InstanceOf: ListX
Title: "List example of ListX"
Description: "List example of ListX with some content - inline"
Usage: #inline
* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> hello world </div>"
* status = #current
* mode = #working
* subject = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003)
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000001)
* entry[+].item = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003)

Instance: ex-ListX
InstanceOf: ListX
Title: "List example of ListX"
Description: "List example of ListX with some data"
Usage: #example
* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"> hello world </div>"
* status = #current
* mode = #working
* subject = Reference(Patient/ex-Patient)
* entry[+].item = Reference(DocumentReference/ex-DocumentReferenceX)


Profile: DocumentReferenceX
Parent: DocumentReference
Title: "DocumentReference X profile"
Description: "DocumentReference example of DocumentReferenceX - inline"
* status = #current
//* author ^type.aggregation = #contained
 
Instance: aaaaaaaa-bbbb-cccc-dddd-e00000000001
InstanceOf: DocumentReferenceX
Title: "DocumentReference example of DocumentReferenceX"
Description: "DocumentReference example with some content - inline"
Usage: #inline
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActCode#ETHUD
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R
* status = #current
* subject = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003)
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain
* securityLabel[+] = http://terminology.hl7.org/CodeSystem/v3-ActCode#ETHUD
* securityLabel[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R
* contained[0] = in-practitioner
* author = Reference(in-practitioner)

Instance: ex-DocumentReferenceX
InstanceOf: DocumentReferenceX
Title: "DocumentReference example of DocumentReferenceX"
Description: "DocumentReference example with some content"
Usage: #example
* status = #current
* subject = Reference(urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00000000003)
* content.attachment.title = "Hello World"
* content.attachment.contentType = #text/plain
* contained[0] = in-practitioner
* author = Reference(in-practitioner)


Instance: in-practitioner
InstanceOf: Practitioner
Title: "Practitioner example"
Description: "Practitioner example with some content - inline"
Usage: #inline
* telecom.system = #email
* telecom.value = "JohnMoehrke@gmail.com"

Instance: ex-practitioner
InstanceOf: Practitioner
Title: "Practitioner example"
Description: "Practitioner example with some content"
Usage: #example
* telecom.system = #email
* telecom.value = "JohnMoehrke@gmail.com"


Instance: aaaaaaaa-bbbb-cccc-dddd-e00000000003
InstanceOf: Patient
Title: "Patient example"
Description: "Patient with some content - inline"
Usage: #inline
* name[+].family = "Schmidt"
* name[=].given = "Dumb"

Instance: ex-Patient
InstanceOf: Patient
Title: "Patient example"
Description: "Patient with some content"
Usage: #example
* name[+].family = "Schmidt"
* name[=].given = "Dumb"

Instance:   ex-BundleX
InstanceOf: BundleX
Title:      "ex-dummy Bundle of profile BundleX"
Description: "Bundle with some content"
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

Instance:   ex-Bundle
InstanceOf: Bundle
Title:      "ex-dummy unprofiled Bundle"
Description: "Bundle with some content"
Usage: #example
* type = #transaction
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActCode#DELAU
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R
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

