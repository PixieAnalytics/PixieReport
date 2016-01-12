$(document).ready(function(){
if (window.location.href.match("projects")){
      getData()
    }
  $(document).on('page:load',function(){
    if (window.location.href.match("projects")){
      getData()
    }
  })

})

