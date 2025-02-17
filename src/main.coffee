matching = require './matching'
scoring = require './scoring'
time_estimates = require './time_estimates'
feedback = require './feedback'

time = -> (new Date()).getTime()

zxcvbn = (password, user_inputs = [], language) ->
  start = time()

  if !['en', 'nl', 'fr', 'de'].includes(language)
    console.warn("Unsupported language: " + language + ". Falling back to en")
    language = "en"

  # reset the user inputs matcher on a per-request basis to keep things stateless
  sanitized_inputs = []
  for arg in user_inputs
    if typeof arg in ["string", "number", "boolean"]
      sanitized_inputs.push arg.toString().toLowerCase()
  matching.set_user_input_dictionary sanitized_inputs, language
  matches = matching.omnimatch password, language
  result = scoring.most_guessable_match_sequence password, matches
  result.calc_time = time() - start
  attack_times = time_estimates.estimate_attack_times result.guesses
  for prop, val of attack_times
    result[prop] = val
  result.feedback = feedback.get_feedback result.score, result.sequence
  result.lang = language
  result

module.exports = zxcvbn
