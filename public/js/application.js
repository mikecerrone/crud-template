$(document).ready(function() {

  var hideElement = function(element){
  $(element).hide()};


  $('#createPost').on('click', function(event){
   event.preventDefault();
   hideElement('#createPost')
   hideElement('#createPostLabel')
   $.ajax({
      method: "get",
      url: "/posts/new"
     })
   .done(function(response){
      console.log(response)
     $("#addPost").append(response)
 });


  })
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
