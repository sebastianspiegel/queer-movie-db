user_l = User.create(username: "catlady", password: "abc123")
user_m = User.create(username: "catman", password: "abc123")
user_t = User.create(username: "test user", password: "test")

# title, imdb_url, year, summary, network

Show.new(title: "test show", network: "network1", imdb_url: "https://www.imdb.com", year: "2020", summary: "test summary", user_id: user_t)

Show.new(title: "Schitt’s Creek", network: "CBC", imdb_url: "https://www.imdb.com/title/tt3526078/", year: "2015", summary: "When rich video-store magnate Johnny Rose and his family suddenly find themselves broke, they are forced to leave their pampered lives to regroup in Schitt's Creek.", user_id: user_l)

Show.new(title: "Brooklyn Nine-Nine", network: "NBC", imdb_url: "https://www.imdb.com/title/tt2467372/" year: "2013", summary: "Brooklyn Nine-Nine follows the exploits of hilarious Det. Jake Peralta and his diverse, lovable colleagues as they police the NYPD's 99th Precinct.", user_id: user_m)