$('textarea[data-provide="markdown"]').each(function(){
    var $this = $(this);

    if ($this.data('markdown')) {
        $this.data('markdown').showEditor();
    }
    else $this.markdown()

    $this.parent().find('.btn').addClass('btn-white');
})