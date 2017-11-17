//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .

var tabs = document.querySelectorAll('.tab')
var tabContents = document.querySelectorAll('.tab-content')


tabs.forEach((tab) => {
  tab.addEventListener('focus', function(event) {
    var target = event.currentTarget.dataset.target
    clearTabContents()
    document.getElementById(target).classList.remove('hidden')
  clearTabs()
  tab.classList.add('active')
  })
})


function clearTabContents() {
  tabContents.forEach(function(tabContent) {
    tabContent.classList.add('hidden')
  })
}

function clearTabs() {
  tabs.forEach(function(tab) {
    tab.classList.remove('active')
  })
}
