//
//  PGPSignaturePacketTests.m
//  ObjectivePGP
//
//  Created by Marcin Krzyzanowski on 21/01/15.
//  Copyright (c) 2015 Marcin Krzyżanowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSInputStream+PGPTests.h"
#import "PGPPublicKeyPacket.h"
#import "PGPSignaturePacket.h"
#import "PGPSignatureSubpacket.h"
#import "PGPPacketHeader.h"

@interface PGPSignaturePacketTests : XCTestCase
@end

@implementation PGPSignaturePacketTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testSignature1 {
    
//  Old: Signature Packet(tag 2)(317 bytes)
//      Ver 4 - new
//      Sig type - Positive certification of a User ID and Public Key packet(0x13).
//      Pub alg - RSA Encrypt or Sign(pub 1)
//      Hash alg - SHA512(hash 10)
//      Hashed Sub: signature creation time(sub 2)(4 bytes)
//      Time - Wed Jun  4 06:21:16 CEST 2014
//      Hashed Sub: key flags(sub 27)(1 bytes)
//      Flag - This key may be used to certify other keys
//      Flag - This key may be used to sign data
//      Hashed Sub: key expiration time(sub 9)(4 bytes)
//      Time - Mon Jun  4 06:21:16 CEST 2018
//      Hashed Sub: preferred symmetric algorithms(sub 11)(4 bytes)
//      Sym alg - AES with 256-bit key(sym 9)
//      Sym alg - AES with 192-bit key(sym 8)
//      Sym alg - AES with 128-bit key(sym 7)
//      Sym alg - CAST5(sym 3)
//      Hashed Sub: preferred hash algorithms(sub 21)(4 bytes)
//      Hash alg - SHA512(hash 10)
//      Hash alg - SHA384(hash 9)
//      Hash alg - SHA256(hash 8)
//      Hash alg - SHA224(hash 11)
//      Hashed Sub: preferred compression algorithms(sub 22)(4 bytes)
//      Comp alg - ZLIB <RFC1950>(comp 2)
//      Comp alg - BZip2(comp 3)
//      Comp alg - ZIP <RFC1951>(comp 1)
//      Comp alg - Uncompressed(comp 0)
//      Hashed Sub: features(sub 30)(1 bytes)
//      Flag - Modification detection (packets 18 and 19)
//      Hashed Sub: key server preferences(sub 23)(1 bytes)
//      Flag - No-modify
//  Sub: issuer key ID(sub 16)(8 bytes)
//      Key ID - 0x91E0E6EFF7965496
//      Hash left 2 bytes - 1e 99
//      RSA m^d mod n(2047 bits) - ...
//      -> PKCS-1
   
    Byte signature[] = {0x89,0x01,0x3D,0x04,0x13,0x01,0x0A,0x00,0x27,0x05,0x02,0x53,0x8E,0x9E,0xBC,0x02,0x1B,0x03,0x05,0x09,0x07,0x86,0x1F,0x80,0x05,0x0B,0x09,0x08,0x07,0x03,0x05,0x15,0x0A,0x09,0x08,0x0B,0x05,0x16,0x02,0x03,0x01,0x00,0x02,0x1E,0x01,0x02,0x17,0x80,0x00,0x0A,0x09,0x10,0x91,0xE0,0xE6,0xEF,0xF7,0x96,0x54,0x96,0x1E,0x99,0x07,0xFF,0x57,0x78,0x9C,0xF4,0x2C,0x1B,0xA6,0x71,0x0B,0x6E,0x0A,0xF5,0xC0,0xED,0xFA,0x7A,0xDF,0x13,0xE7,0xAD,0x7E,0x1E,0x2A,0x76,0x38,0x2D,0xFF,0x53,0x4B,0x92,0x4C,0x8E,0x7F,0x88,0x9B,0x8B,0x6E,0xE7,0x42,0xDC,0x73,0x1B,0x65,0xBF,0x0C,0x59,0xE1,0x7D,0xEC,0x0D,0xA3,0x5C,0x35,0x3E,0x90,0xCA,0x46,0xE7,0x71,0x5A,0xC6,0x1D,0x29,0xD8,0x8F,0x8E,0xCE,0x5A,0x77,0x3D,0xF5,0x5E,0xEF,0x58,0x98,0x31,0xFE,0x34,0x46,0x49,0xB1,0xBC,0x12,0x83,0xF7,0x6A,0x1A,0x6C,0x2B,0x15,0x3A,0x9C,0xB3,0x14,0x4D,0xD2,0x6B,0xD2,0xC1,0x7F,0xBB,0x4C,0x67,0x0C,0x36,0x9F,0x52,0x87,0x3B,0x5D,0x6D,0x1F,0xBC,0xCA,0xA4,0x9F,0xD6,0x6A,0x66,0xF4,0x14,0xD4,0xF0,0x20,0x20,0x36,0x72,0x8A,0x2A,0x98,0x5F,0xD2,0x08,0x19,0xA6,0x07,0x6D,0x05,0x3B,0x0A,0xCE,0xAD,0xED,0xB2,0xFF,0x82,0x37,0x88,0x55,0xC2,0xA9,0x5A,0xFC,0xC7,0xE1,0xBF,0x3E,0xA7,0xA4,0x60,0x33,0x5D,0xA4,0x04,0xD5,0x78,0xF1,0x6D,0x4F,0x20,0xCB,0x0E,0x44,0x24,0x2B,0xDD,0xFC,0x98,0x92,0xF5,0x73,0x1B,0xDA,0x7D,0xEE,0x56,0x34,0xB2,0x13,0x2D,0xE7,0xE8,0x78,0x60,0x82,0xBB,0x24,0x12,0x4A,0xDB,0x6C,0xC1,0x56,0x27,0xB0,0x91,0x35,0x95,0x28,0xAA,0x55,0xEC,0x9F,0xDC,0xF5,0xA7,0xB8,0xC0,0x7A,0xB6,0xDB,0x2E,0xAC,0xD5,0xDB,0x9B,0x9E,0x88,0x4B,0x05,0x5A,0x90,0x5C,0x87,0xB2,0x12,0x6D,0x2C,0xC5,0x60,0x67,0x55,0x9E,0x09,0xA6,0xF9,0x99,0x85,0xD9,0x53,0xA5,0x05,0xA0,0x3F,0xA9, 0x89};
    NSInputStream *stream = [NSInputStream inputStreamWithBytes:signature length:sizeof(signature)];
    [stream open];
    
    NSError *error;
    PGPPacketHeader *header = [PGPPacketHeader readFromStream:stream error:&error];
    XCTAssertEqual(header.bodyLength, 317);
    PGPSignaturePacket *packet = [PGPSignaturePacket readFromStream:stream error:&error];
    XCTAssertEqual(packet.signatureType, PGPSignaturePositiveCertificationUserIDandPublicKey);
    XCTAssertEqual(packet.publicKeyAlgorithm, PGPPublicKeyAlgorithmRSA);
    XCTAssertEqual(packet.hashAlgoritm, PGPHashSHA512);
    XCTAssertEqualObjects(packet.creationDate, [NSDate dateWithTimeIntervalSince1970:1401855676]);
    [stream close];
}

@end
