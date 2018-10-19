//= require ./vue.min

function initPhrasesList(selector, phrases) {
  new Vue({
    el: selector,
    data: {
      phrases: phrases
    }
  });
}
