// ==UserScript==
// @name        GitHub Collapse
// @namespace   github-collapse
// @include     https://github.com/*
// @version     1
// @grant       none
// ==/UserScript==

(function() {

  var butHtml = '<a href="#collapse_diff" style="margin-left: 5px" class="diff-collapse-button btn btn-sm" rel="nofollow">Collapse</a>';
  var collapsedHtml = '<div class="image diff-collapsed-message" style="display: none"><a href="#" class="expand-diff-link">Diff suppressed. Click to show.</a></div>';
  var filesTab = document.querySelector('[data-container-id="files_bucket"]');

  var debug = function(m) {
    if (localStorage.getItem('debug-gh-collapse')) {
      console.log(m);
    }
  };

  var endsWith = function(s, end) {
    return s.slice(-end.length) === end;
  };

  var startsWith = function(s, start) {
    return s.slice(0, start.length) === start;
  };

  var expand = function(button, content, message) {
    button.textContent = 'Collapse';
    content.style.display = ''; // Restore original display (table/block)
    if(message) { message.style.display = 'none'; }

  };

  var collapse = function(button, content, message) {
    button.textContent = 'Expand';
    content.style.display = 'none';
    if(message) { message.style.display = 'block'; }
  };

  var bindToggler = function(meta, tableToToggle, addPlaceHolder) {
    var messageDiv, button, buttonContainer, path;
    debug('in bindToggler');
    if(!tableToToggle) { return; }

    buttonContainer = meta.querySelector('.file-actions');
    buttonContainer.insertAdjacentHTML('afterbegin', butHtml);
    tableToToggle.insertAdjacentHTML('afterend', collapsedHtml);
    button = buttonContainer.querySelector('.diff-collapse-button');
    path = meta.attributes['data-path'].value;

    if(addPlaceHolder) {
      messageDiv = tableToToggle.parentElement.querySelector('.diff-collapsed-message');
      messageDiv.querySelector('.expand-diff-link').addEventListener('click', function(e) {
        e.preventDefault();
        expand(button, tableToToggle, messageDiv);
      }, true);
    }

    debug('checking if path ' + path + ' should be auto-collapsed');
    if (startsWith(path, 'static/js/templates/') || startsWith(path, 'static/dist/') || endsWith(path, '.css') || endsWith(path, '.svg')) {
      debug('auto-collapsing path ' + path);
      collapse(button, tableToToggle, messageDiv);
    }

    button.addEventListener('click', function(e) {
      e.preventDefault();
      if (button.textContent !== 'Collapse') {
        expand(button, tableToToggle, messageDiv);
      } else {
        collapse(button, tableToToggle, messageDiv);
      }
    }, true);
  };

  var collapseTogglesAdded = false;

  var addCollapseToggles = function (fileContainers) {
    var i;
    debug('in addCollapseToggles with ' + fileContainers.length + ' files');
    if (collapseTogglesAdded || !fileContainers.length) { return; }
    debug('collapseToggles not added yet, adding');

    for (i = 0; i < fileContainers.length; ++i) {
      debug('adding collapse toggles for file ' + i);
      bindToggler(fileContainers[i].querySelector('.file-header'),
        fileContainers[i].querySelector('table.file-diff, .diff-table'), true);
    }

    collapseTogglesAdded = true;
  };

  var getFileContainers = function () {
    return document.querySelectorAll('#files .file');
  };

  addCollapseToggles(getFileContainers());

  var keepCheckingFilesTab = function () {
    var checkFilesTab = function () {
      debug('looking for file containers');
      var fileContainers = getFileContainers();
      if (fileContainers.length) {
        debug('found ' + fileContainers.length + ' file containers');
        window.clearInterval(intervalId);
        addCollapseToggles(fileContainers);
      }
    };
    var intervalId = window.setInterval(checkFilesTab, 1000);
  };

  filesTab.addEventListener('click', keepCheckingFilesTab, false);
})();
