// Find current id
$('document').ready(function(){
  var currentID = $('#video-player').attr('data-video-id');
  var currentVideo;
  var nextVideo;
  var prevVideo;

  var currentVideo = getCurrent(currentID);
  // console.log(currentVideo);
  getNext(currentVideo);
  getPrev(currentVideo);

});

function getCurrent(currentID) {
  var _self = $('.video-thumbnail').find('[data-video-thumb-id="' + currentID + '"]');
  _self.addClass("watching");
  return _self;
}
function getNext(currentVideo) {
  var _next = currentVideo.next('.video-thumbnail');
  var nextVideo = _next;
  return nextVideo;
}
function getPrev(currentVideo) {
  var _prev = currentVideo.prev('.video-thumbnail');
  var prevVideo = _prev
  return prevVideo;
}
