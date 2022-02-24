$(document).ready(function(){
  function setTooltip(btn, message) {
    $(btn).tooltip('hide')
      .attr('data-original-title', message)
      .tooltip('show');
  }

  function hideTooltip(btn) {
    setTimeout(function() {
      $(btn).tooltip('hide');
    }, 1000);
  }

  $('.clippyjs').tooltip({
      trigger: 'click',
      placement: 'bottom'
    });

  var clipboard = new ClipboardJS('.clippyjs');

  clipboard.on('success', function(e) {
    e.clearSelection();
    setTooltip(e.trigger, 'Copied!');
    hideTooltip(e.trigger);
  });

  clipboard.on('error', function(e) {
    e.clearSelection();
    setTooltip(e.trigger, 'Failed!');
    hideTooltip(e.trigger);
  });

});

Shiny.addCustomMessageHandler(
  'copy-value', function(message) {
    $('#' + message.id).attr('data-clipboard-text', message.text)
});
