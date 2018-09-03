$(document).ready(function(){
    $(".add-more").click(function(e){
        e.preventDefault();
        var newIn = $(this).prev('select').clone();
        var removeBtn = '<button type="button" class="btn btn-danger remove-me" >-</button></div><div id="field">';
        var removeButton = $(removeBtn);

        $(this).after(newIn);
        $(newIn).after(removeButton);

        $('.remove-me').click(function(e){
            e.preventDefault();
            $(this).prev('select').remove();
            $(this).remove();
        });
    });

    $('.amount').on('change', function(){
        var goal_amount = $('#goal-amount').data('amount');
        goal_amount -= sumAmount();
        if(goal_amount < 0) {
            alert('Valores não podem ultrapassar o total da Meta')
            $(this).val('');
        } else if(goal_amount === 0) {
            $('#remaining').html(goal_amount)
            $('#submit-button').prop('disabled', false);
        } else {
            $('#submit-button').prop('disabled', true);
            $('#remaining').html(goal_amount)
        }
    })

    function sumAmount() {
        var sum = 0;
        var arr = $('.amount').map(function() {
            return $(this).val();
        }).get();
        $.each(arr,function(){sum+=parseFloat(this) || 0;});
        return sum;
    }

});