var item = document.querySelector('.items');
for(i-0;i<item.length;i++){
    items[i].addEventListener('click',function(){
        this.classic.add('active');
    })
}

/*
$(".items").click(function(event){
    $(".items").each(function(){
        $(this).removeClass("active-item");
    })
    $(this).addClass("active-item");   
})
*/
