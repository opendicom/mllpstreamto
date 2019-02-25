# mllpstreamto
objective-c command tool which pipes one hl7 message using tcp protocol mlllp (minimal lower layer protocol)

## example
´´´bash
echo "MSH|^~\\&|SENDER|SENDER_ORG|RECEIVER|RECEIVER_ORG|||ORM^O01|13668358090840.5981941519013931||2.3.1|||||UY|ISO_IR 100\rPID|||777777^^^^2.16.840.1.113883.2.14.2.1||Fauquex^Jacques||19871024\rORC|NW|2013424203649|||||^^^201304242036^^MEDIUM||20130424203649||||||||RECEIVER\rOBR||987861||^^^32^TAC DE CRANEO^CT||||||||||||||987861|1|||||CT|||^^^201111301500\rZDS|987861"
| ./mllpstreamto 127.0.0.1:2575
´´´

pipes the message hl7 v2.3.1 to mllpstreato, which streams it to localhost ip at port 2575 using defaut charset syntax latin1.

## syntax

hl7utf8message | mllpsend ip:port [encoding]

returns  0 when succes payload was received

### encodings

* NSASCIIStringEncoding = 1
* NSUTF8StringEncoding = 4
* NSISOLatin1StringEncoding = 5 (default, if value is omitted)

It is assumed that the terminal uses string encoding utf-8 and that the message piped is in utf-8. The message is then encoded in the destination string encoding before being streamed.

