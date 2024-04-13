local Translations = {
    error = {
        label = 'The original item does not exist.',
        title = 'Incorrect Item'
    },
    success = {
      label = 'Some stress was relieved.',
      title = 'Stress Relieved'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})