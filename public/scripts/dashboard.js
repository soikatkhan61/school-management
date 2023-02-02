document.querySelectorAll('.sidebar-submenu').forEach(e => {
    e.querySelector('.sidebar-menu-dropdown').onclick = (event) => {
        event.preventDefault()
        e.querySelector('.sidebar-menu-dropdown .dropdown-icon').classList.toggle('active')

        let dropdown_content = e.querySelector('.sidebar-menu-dropdown-content')
        let dropdown_content_lis = dropdown_content.querySelectorAll('li')

        let active_height = dropdown_content_lis[0].clientHeight * dropdown_content_lis.length

        dropdown_content.classList.toggle('active')

        dropdown_content.style.height = dropdown_content.classList.contains('active') ? active_height + 'px' : '0'
    }
})

let overlay = document.querySelector('.overlay')
let sidebar = document.querySelector('.sidebar')
let sidebar_container = document.getElementById('sidebar_container')


document.querySelector('#mobile-toggle').onclick = () => {
    console.log("cliclk");
    sidebar.classList.toggle('active')
    overlay.classList.toggle('active')
}

document.querySelector('#sidebar-close').onclick = () => {
    console.log("cliclk");
    sidebar.classList.toggle('active')
    overlay.classList.toggle('active')
}

document.addEventListener('click', function (event) {
    if (!event.target.closest('#sidebar_container') && !event.target.closest('#mobile-toggle') ) {
        console.log("click");
        sidebar.classList.remove('active')
        overlay.classList.remove('active')
    }
});