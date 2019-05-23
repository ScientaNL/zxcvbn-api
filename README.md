# i18n-api version of `zxcvbn`  🔐
[`original zxcvbn readme here`](https://github.com/dropbox/zxcvbn)


#### Why:
We decided to build this web-api wrapper with i18n support because:
- `zxcvbn` is too large to use in client javascript (~400kb gzipped).
- It only had support for english names and words.

*This is only intended to run on a server, do not send this amount of data to your client.*

Languages at this time: `EN`, `FR`, `NL`.

Feel free to add any languages by pull request, or provide us with language datasets.

---

### Usage:

run `docker-compose up -d` to start the container on `localhost:3000`


#### Api usage:

```apib
### route: /zxcvbn [POST]

+ Request (application/json)

    + Body
        {
            "password": "correcthorsebatterystaple",
            "weakList": [],
            "language" : "en"
        }

+ Response 200 (application/json)

    + Body
        {
            "password": "correcthorsebatterystaple",
            "guesses": 273500327700640,
            "guesses_log10": 14.436957851029574,
            "sequence": [
                {
                    "pattern": "dictionary",
                    "i": 0,
                    "j": 6,
                    "token": "correct",
                    "matched_word": "correct",
                    "rank": 1140,
                    "dictionary_name": "us_tv_and_film",
                    "reversed": false,
                    "l33t": false,
                    "base_guesses": 1140,
                    "uppercase_variations": 1,
                    "l33t_variations": 1,
                    "guesses": 1140,
                    "guesses_log10": 3.0569048513364723
                },
                {
                    "pattern": "dictionary",
                    "i": 7,
                    "j": 11,
                    "token": "horse",
                    "matched_word": "horse",
                    "rank": 701,
                    "dictionary_name": "passwords",
                    "reversed": false,
                    "l33t": false,
                    "base_guesses": 701,
                    "uppercase_variations": 1,
                    "l33t_variations": 1,
                    "guesses": 701,
                    "guesses_log10": 2.8457180179666586
                },
                {
                    "pattern": "dictionary",
                    "i": 12,
                    "j": 18,
                    "token": "battery",
                    "matched_word": "battery",
                    "rank": 2197,
                    "dictionary_name": "wikipedia",
                    "reversed": false,
                    "l33t": false,
                    "base_guesses": 2197,
                    "uppercase_variations": 1,
                    "l33t_variations": 1,
                    "guesses": 2197,
                    "guesses_log10": 3.34183005692051
                },
                {
                    "pattern": "dictionary",
                    "i": 19,
                    "j": 24,
                    "token": "staple",
                    "matched_word": "staple",
                    "rank": 6467,
                    "dictionary_name": "wikipedia",
                    "reversed": false,
                    "l33t": false,
                    "base_guesses": 6467,
                    "uppercase_variations": 1,
                    "l33t_variations": 1,
                    "guesses": 6467,
                    "guesses_log10": 3.8107028609471167
                }
            ],
            "calc_time": 3,
            "crack_times_seconds": {
                "online_throttling_100_per_hour": 9846011797223040,
                "online_no_throttling_10_per_second": 27350032770064,
                "offline_slow_hashing_1e4_per_second": 27350032770.064,
                "offline_fast_hashing_1e10_per_second": 27350.032770064
            },
            "crack_times_display": {
                "online_throttling_100_per_hour": "centuries",
                "online_no_throttling_10_per_second": "centuries",
                "offline_slow_hashing_1e4_per_second": "centuries",
                "offline_fast_hashing_1e10_per_second": "8 hours"
            },
            "score": 4,
            "feedback": {
                "warning": "",
                "suggestions": []
            },
            "lang": "en"
        }
        
        
### route: /zxcvbn/score [POST]

+ Request (application/json)

    + Body
        {
            "password": "correcthorsebatterystaple",
            "weakList": [],
            "language" : "en"
        }

+ Response 200 (application/json)

    + Body
        {
            "score": 4
        }
```

---

### Improvements:

- All the langauges are included at the moment since there are only 3, when needed, it should use dynamic loading of the datasets.
- Better error handling
- Improve datasets

--- 

### Acknowledgments

[Dropbox](https://dropbox.com) for supporting open source!

Mark Burnett for releasing his 10M password corpus and for his 2005 book, [Perfect Passwords: Selection, Protection, Authentication](http://www.amazon.com/Perfect-Passwords-Selection-Protection-Authentication/dp/1597490415).

Wiktionary contributors for building a [frequency list of English words](http://en.wiktionary.org/wiki/Wiktionary:Frequency_lists) as used in television and movies.

Researchers at Concordia University for [studying password estimation rigorously](http://www.concordia.ca/cunews/main/stories/2015/03/25/does-your-password-pass-muster.html) and recommending zxcvbn.

And [xkcd](https://xkcd.com/936/) for the inspiration :+1::horse::battery::heart:
