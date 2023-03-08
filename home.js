var items = document.querySelectorAll('.items');
let makeActive = function(event){
    //console.log(event)  
    items.forEach(element => {
        element.classList.remove("active-item");
        element.classList.add("inactive-item");
    });
    let currentId=event.target.id ;
    console.log(event.target);
    document.getElementById(currentId).classList.remove("inactive-item");
    document.getElementById(currentId).classList.add("active-item");

}

for(let i=0;i<items.length;i++){
    items[i].addEventListener('click',makeActive)
}


/*
$(".items").click(function(event){
    $(".items").each(function(){
        $(this).removeClass("active-item");
    })
    $(this).addClass("active-item");   
})
*/
