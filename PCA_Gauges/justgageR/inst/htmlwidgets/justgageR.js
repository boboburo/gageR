HTMLWidgets.widget({

  name: 'justgageR',

  type: 'output',

  initialize: function(el, width, height) {

    var gauge = JustGage()
        .min(0)
        .max(50)
        .value(25)
        .title("First")
        .height("100%"")
        .width("200%");

    return {
      // TODO: add instance fields as required
      gauge: gauge
    }

  },

  renderValue: function(el, x, instance) {

    var guage = instance.guage;

  },

  resize: function(el, width, height, instance) {

renderValue(el, width,height, instance);
  }

});
