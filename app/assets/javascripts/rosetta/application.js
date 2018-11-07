//= require ./vendor/vue.min
//= require ./vendor/lunr
//= require ./vendor/autosize.min

function initPhrasesList(selector, phrases) {
  new Vue({
    el: selector,

    data: {
      phrases: phrases,
      query: '',
      menuOpened: false,
    },

    computed: {
      searchIndex: function() {
        var that = this;

        return lunr(function () {
          this.ref('code');
          this.field('text');

          that.phrases.forEach(function (phrase) {
            this.add(phrase);
          }, this);
        });
      },

      filteredPhrases: function () {
        if (this.query) {
          var results = this.searchIndex.search(this.query);
          return this.phrases.filter(function (phrase) {
            return results.some(function (result) {
              return result.ref === phrase.code;
            });
          });
        } else {
          return this.phrases;
        }
      }
    },

    updated: function () {
      this.$nextTick(function () {
        autosize(document.querySelectorAll('.database__field'));
      });
    },

    methods: {
      toggleNav: function() {
        this.menuOpened = !this.menuOpened;
      }
    }
  });
}
