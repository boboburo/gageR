HTMLWidgets.widget({

  name: 'gageR',

  type: 'output',

  initialize: function(el, width, height) {
    el.style.height = height + "px";
		el.style.width = width + "px";
    return el;
    //{
      // TODO: add instance fields as required
    //}

  },

  renderValue: function(el, x, instance) {

    //el.innerText = x.message;
    var gauge1 = new JustGage({
			parentNode: el,
			title: x.title,
			value: x.value,
			min: x.min,
			max: x.max,
			decimals: 0,
			counter: true
		});


  },

  resize: function(el, width, height, instance) {
  	el.style.height = height + "px";
		el.style.width = width + "px";
		return el;

  }

});
