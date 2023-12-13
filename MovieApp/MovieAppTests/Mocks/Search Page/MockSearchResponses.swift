//
//  MockSearchResponses.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import Foundation

let mockSuccessResponseTenResults =
"""
{"Search":[{"Title":"The Avengers","Year":"2012","imdbID":"tt0848228","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"},{"Title":"Avengers: Endgame","Year":"2019","imdbID":"tt4154796","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg"},{"Title":"Avengers: Infinity War","Year":"2018","imdbID":"tt4154756","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_SX300.jpg"},{"Title":"Avengers: Age of Ultron","Year":"2015","imdbID":"tt2395427","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg"},{"Title":"The Avengers","Year":"1998","imdbID":"tt0118661","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BYWE1NTdjOWQtYTQ2Ny00Nzc5LWExYzMtNmRlOThmOTE2N2I4XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg"},{"Title":"The Avengers: Earth's Mightiest Heroes","Year":"2010–2012","imdbID":"tt1626038","Type":"series","Poster":"https://m.media-amazon.com/images/M/MV5BYzA4ZjVhYzctZmI0NC00ZmIxLWFmYTgtOGIxMDYxODhmMGQ2XkEyXkFqcGdeQXVyNjExODE1MDc@._V1_SX300.jpg"},{"Title":"Ultimate Avengers: The Movie","Year":"2006","imdbID":"tt0491703","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BMTYyMjk0NTMwMl5BMl5BanBnXkFtZTgwNzY0NjAwNzE@._V1_SX300.jpg"},{"Title":"Ultimate Avengers II","Year":"2006","imdbID":"tt0803093","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BZjI3MTI5ZTYtZmNmNy00OGZmLTlhNWMtNjZiYmYzNDhlOGRkL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"},{"Title":"The Avengers","Year":"1961–1969","imdbID":"tt0054518","Type":"series","Poster":"https://m.media-amazon.com/images/M/MV5BZWQwZTdjMDUtNTY1YS00MDI0LWFkNjYtZDA4MDdmZjdlMDRlXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg"},{"Title":"Avengers Assemble","Year":"2012–2019","imdbID":"tt2455546","Type":"series","Poster":"https://m.media-amazon.com/images/M/MV5BMTY0NTUyMDQwOV5BMl5BanBnXkFtZTgwNjAwMTA0MDE@._V1_SX300.jpg"}],"totalResults":"137","Response":"True"}
"""


let mockSuccessResponseOneResult =
"""
{"Search":[{"Title":"The Avengers","Year":"2012","imdbID":"tt0848228","Type":"movie","Poster":"https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"}],"totalResults":"137","Response":"True"}
"""


let mockFailureResponse =
"""
{"Response":"False","Error":"Movie not found!"}
"""


let mockSuccessDetailsResponse =
"""
{"Title":"Kill Bill: Vol. 1","Year":"2003","Rated":"R","Released":"10 Oct 2003","Runtime":"111 min","Genre":"Action, Crime, Drama","Director":"Quentin Tarantino","Writer":"Quentin Tarantino, Uma Thurman","Actors":"Uma Thurman, David Carradine, Daryl Hannah","Plot":"The lead character, called 'The Bride,' was a member of the Deadly Viper Assassination Squad, led by her lover 'Bill.' Upon realizing she was pregnant with Bill's child, 'The Bride' decided to escape her life as a killer. She fled to Texas, met a young man, who, on the day of their wedding rehearsal was gunned down by an angry and jealous Bill (with the assistance of the Deadly Viper Assassination Squad). Four years later, 'The Bride' wakes from a coma, and discovers her baby is gone. She, then, decides to seek revenge upon the five people who destroyed her life and killed her baby. The saga of Kill Bill Volume I begins.","Language":"English, Japanese, French","Country":"United States","Awards":"Nominated for 5 BAFTA 29 wins & 104 nominations total","Poster":"https://m.media-amazon.com/images/M/MV5BNzM3NDFhYTAtYmU5Mi00NGRmLTljYjgtMDkyODQ4MjNkMGY2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg","Ratings":[{"Source":"Internet Movie Database","Value":"8.2/10"},{"Source":"Rotten Tomatoes","Value":"85%"},{"Source":"Metacritic","Value":"69/100"}],"Metascore":"69","imdbRating":"8.2","imdbVotes":"1,088,351","imdbID":"tt0266697","Type":"movie","DVD":"13 Apr 2004","BoxOffice":"$70,099,045","Production":"N/A","Website":"N/A","Response":"True"}
"""


let mockFailureDetailsResponse =
"""
{"Response":"False","Error":"Error getting data."}
"""
