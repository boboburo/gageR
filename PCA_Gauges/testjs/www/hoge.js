function fetchingXHR() {
  var xhr = new XMLHttpRequest();
  var rejection = null;

  var fetching = new Promise((resolve, reject) => {
    rejection = reject;

    xhr.open("GET", "http://example.com", true);
    xhr.onload = function () {
      resolve(xhr.responseText);
    };

    xhr.onerror = function () {
      reject("by xhr.onerror!");
    };

    xhr.send();
  });

  var aborter = function () {
    xhr.abort();
    rejection("by aborter!");
  };

  return [fetching, aborter];
};


var [fetching, aborter] = fetchingXHR();
aborter();
fetching.catch(function(e){
  console.log("reason:", e);
});
