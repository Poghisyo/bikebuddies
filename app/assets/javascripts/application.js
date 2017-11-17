//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .

const tabs = document.querySelectorAll('.tab')
const tabContents = document.querySelectorAll('.tab-content')


tabs.forEach((tab) => {
  tab.addEventListener('focus', (event) => {
    let target = event.currentTarget.dataset.target
    clearTabContents()
    document.getElementById(target).classList.remove('hidden')
  clearTabs()
  tab.classList.add('active')
  })
})


function clearTabContents() {
  tabContents.forEach((tabContent) => {
    tabContent.classList.add('hidden')
  })
}

function clearTabs() {
  tabs.forEach((tab) => {
    tab.classList.remove('active')
  })
}
