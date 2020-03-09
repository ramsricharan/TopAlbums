//
//  Top_AlbumsTests.swift
//  Top AlbumsTests
//
//  Created by Ram Sri Charan on 3/7/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import XCTest
@testable import Top_Albums

class Top_AlbumsTests: XCTestCase {

    var testAlbum: Album!
    var testViewModal: AlbumListViewModal!
    
    override func setUp() {
        
        let genres: [Genre] = [Genre(genreId: nil, name: "Pop", url: nil), Genre(genreId: nil, name: "Rock", url: nil)]

        testAlbum = Album(artistName: "Tester", releaseDate: "2017/01/11", name: "Test Album", copyright: "All copyrights 2019", url: "https://somewebsite.com", artworkUrl100: nil, genres: genres)
        testViewModal = AlbumListViewModal(Album: testAlbum)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getAlbumNameShort() {
        // Normal Case 1
        testViewModal.albumName = "This is a normal title"
        let actualTitle = testViewModal.getAlbumNameShort()
        let expectedTitle = "This is a normal"
        XCTAssertEqual(actualTitle, expectedTitle)
        
        // Normal Case 2
        testViewModal.albumName = "This isNormalTitleWithVeryLongWordAtTheEnd"
        let actualTitle1 = testViewModal.getAlbumNameShort()
        let expectedTitle1 = "This"
        XCTAssertEqual(actualTitle1, expectedTitle1)
        
        // Small Title case
        testViewModal.albumName = "Small Title"
        let actualTitle2 = testViewModal.getAlbumNameShort()
        let expectedTitle2 = "Small Title"
        XCTAssertEqual(actualTitle2, expectedTitle2)
        
        // No Space case
        let longNameNoSpace = "ThisIsAContinousAlbumTitleWithNoSpaces"
        testViewModal.albumName = longNameNoSpace
        let actualTitle3 = testViewModal.getAlbumNameShort()
        let expectedTitle3 = longNameNoSpace
        XCTAssertEqual(actualTitle3, expectedTitle3)
        
        // Title with bracket
        let longNameWithBracket = "ThisIsA(ContinousAlbumTitleWithNoSpaces)"
        testViewModal.albumName = longNameWithBracket
        let actualTitle4 = testViewModal.getAlbumNameShort()
        let expectedTitle4 = "ThisIsA"
        XCTAssertEqual(actualTitle4, expectedTitle4)
    }

    func test_NilAlbum() {
        let viewModal = AlbumListViewModal(Album: nil)
        
        let actualAlbumName = viewModal.albumName
        let expectedAlbumName = "Untitled"
        XCTAssertEqual(actualAlbumName, expectedAlbumName)
        
        let actualArtistName = viewModal.artistName
        let expectedArtistName = "Unknown"
        XCTAssertEqual(actualArtistName, expectedArtistName)
        
        let actualiTunesURL = viewModal.iTunesURLString
        let expectediTunesURL = ""
        XCTAssertEqual(actualiTunesURL, expectediTunesURL)
        
        let actualHasValidURL = viewModal.isLaunchITunesButtonEnabled
        XCTAssertFalse(actualHasValidURL)
        
        // Check Attributed Strings
        let actualTitleAttr = viewModal.getAlbumTitleAttr().string
        let expectedTitleAttr = "Untitled"
        XCTAssertEqual(actualTitleAttr, expectedTitleAttr)
        
        let actualArtistAttr = viewModal.getArtistAttr().string
        let expectedArtistAttr = "Artist: Unknown"
        XCTAssertEqual(actualArtistAttr, expectedArtistAttr)
        
        let actualCopyrightAttr = viewModal.getCopyrightAttr().string
        let expectedCopyrightAttr = "No Copyright"
        XCTAssertEqual(actualCopyrightAttr, expectedCopyrightAttr)
        
        let actualReleaseDateAttr = viewModal.getReleaseDateAttr().string
        let expecteReleaseDateAttr = "Release Date: No release date"
        XCTAssertEqual(actualReleaseDateAttr, expecteReleaseDateAttr)
        
        let actualGenreAttr = viewModal.getGenreAttr().string
        let expectedGenreAttr = "Genre: None"
        XCTAssertEqual(actualGenreAttr, expectedGenreAttr)
    }
    
    
    func test_getAttributedString() {
        // Check Title Attribute
        let actualTitleAttr = testViewModal.getAlbumTitleAttr().string
        let expectedTitleAttr = testAlbum.name
        XCTAssertEqual(actualTitleAttr, expectedTitleAttr)
        
        // Artist Name Attribute
        let actualArtistAttr = testViewModal.getArtistAttr().string
        let expectedArtistAttr = "Artist: \(testAlbum.artistName!)"
        XCTAssertEqual(actualArtistAttr, expectedArtistAttr)
        
        // Copyright Attribute
        let actualCopyrightAttribute = testViewModal.getCopyrightAttr().string
        let expectedCopyrightAttribute = testAlbum.copyright!
        XCTAssertEqual(actualCopyrightAttribute, expectedCopyrightAttribute)
        
        // Release Date
        let actualReleaseDate = testViewModal.getReleaseDateAttr().string
        let expectedReleaseDate = "Release Date: Jan 11, 2017"
        XCTAssertEqual(actualReleaseDate, expectedReleaseDate)
        
        
        // Check Genre
        let actualGenre = testViewModal.getGenreAttr().string
        let expectedGenre = "Genre: Pop, Rock."
        XCTAssertEqual(actualGenre, expectedGenre)
    }
    
    
    func test_getAlbumCardInfoAttr() {
        // Valid Card Info
        let actualCardInfo = testViewModal.getAlbumCardInfoAttr().string
        let expectedCardInfo = "\(testAlbum.name!)\nBy: \(testAlbum.artistName!)"
        XCTAssertEqual(actualCardInfo, expectedCardInfo)
        
        // Invalid Artist
        testAlbum.artistName = nil
        let viewModal2 = AlbumListViewModal(Album: testAlbum)
        let actualCardInfo2 = viewModal2.getAlbumCardInfoAttr().string
        let expectedCardInfo2 = "\(testAlbum.name!)\nBy: Unknown"
        XCTAssertEqual(actualCardInfo2, expectedCardInfo2)
        
        // Invalid Title and Artist
        testAlbum.name = nil
        let viewModal3 = AlbumListViewModal(Album: testAlbum)
        let actualCardInfo3 = viewModal3.getAlbumCardInfoAttr().string
        let expectedCardInfo3 = "Untitled\nBy: Unknown"
        XCTAssertEqual(actualCardInfo3, expectedCardInfo3)
        
        // Invalid Title
        testAlbum.artistName = "Tester 2"
        let viewModal4 = AlbumListViewModal(Album: testAlbum)
        let actualCardInfo4 = viewModal4.getAlbumCardInfoAttr().string
        let expectedCardInfo4 = "Untitled\nBy: Tester 2"
        XCTAssertEqual(actualCardInfo4, expectedCardInfo4)
        
        
        // Super Big Title
        testAlbum.name = "This is a very long album name so needs to be cut short"
        let viewModal5 = AlbumListViewModal(Album: testAlbum)
        let actualCardInfo5 = viewModal5.getAlbumCardInfoAttr().string
        let expectedCardInfo5 = "This is a very long\nBy: Tester 2"
        XCTAssertEqual(actualCardInfo5, expectedCardInfo5)
    }
    
    func test_getReleaseDateAttr() {
        // Release Date
        let actualReleaseDate = testViewModal.getReleaseDateAttr().string
        let expectedReleaseDate = "Release Date: Jan 11, 2017"
        XCTAssertEqual(actualReleaseDate, expectedReleaseDate)
        
        // Invalid Date format
        testAlbum.releaseDate = "Some Value"
        let viewModal1 = AlbumListViewModal(Album: testAlbum)
        let actualReleaseDate1 = viewModal1.getReleaseDateAttr().string
        let expectedReleaseDate1 = "Release Date: No release date"
        XCTAssertEqual(actualReleaseDate1, expectedReleaseDate1)
        
    }
    
    func test_iTunesURLString() {
        let myViewModal = AlbumListViewModal(Album: testAlbum)
        
        // iTunes URL Valid
        let actualiTunesURL = myViewModal.iTunesURLString
        let expectediTuneURL = "itms://somewebsite.com"
        XCTAssertEqual(actualiTunesURL, expectediTuneURL)
        
        // http protocol
        testAlbum.url = "http://somewebsite.com"
        let myViewModal2 = AlbumListViewModal(Album: testAlbum)
        let actualiTunesURL2 = myViewModal2.iTunesURLString
        let expectediTuneURL2 = "itms://somewebsite.com"
        XCTAssertEqual(actualiTunesURL2, expectediTuneURL2)
        
        // Invalid URL
        testAlbum.url = "www.somewebsite.com"
        let myViewModal3 = AlbumListViewModal(Album: testAlbum)
        let actualiTunesURL3 = myViewModal3.iTunesURLString
        let expectediTuneURL3 = ""
        XCTAssertEqual(actualiTunesURL3, expectediTuneURL3)
    }
    
    

}
