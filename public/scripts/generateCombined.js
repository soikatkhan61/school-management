const menuButton = document.querySelector('#menu-button');
const sideNav = document.querySelector('#side-nav');

menuButton.addEventListener('click', function () {
    if (sideNav.style.display == 'none') {
        sideNav.style.display = 'block'
    } else if (sideNav.style.display == 'block') {
        sideNav.style.display = 'none'
    }
});


//initialize the page wirth necessary settings
window.addEventListener('load', function () {
    let searchParams = new URLSearchParams(window.location.search);
    category = searchParams.get('category') || '';
    year = searchParams.get('year') || '';
    class_id = searchParams.get('class_id') || '';
    subject_id = searchParams.get('subject_id') || '';
    chapter = searchParams.get('chapter') || '';
    q_set = searchParams.get('q_set') || '';
    q_type = searchParams.get('q_type') || '';

    if(category || year){
        sideNav.style.display = 'block'
    }

    

    //initialize the filter section
    if (localStorage.getItem('filter_data')) {
        createFilterElement(localStorage.getItem('filter_data'), category)
    } else {
        fetch("/combined-question/get-filter-data")
            .then(response => response.json())
            .then(filter_data => {
                localStorage.setItem('filter_data', JSON.stringify(filter_data))
                createFilterElement(localStorage.getItem('filter_data'), category)
            })
    }
    
    checkboxSelectIinit()
})


//filter start
const yearSelect = document.getElementById("year");
let searchParams = new URLSearchParams(window.location.search);
let categoryParam = searchParams.get('category') || '';
let yearParam = searchParams.get('year') || '';
let pageParam = searchParams.get('page') || '';
let perPageParam = searchParams.get('perPage') || '';

let page = 1;
let perPage = 25;
let totalPages = 0;

let category;
let year = '';
let previousData = [];


//checkbox select
function checkboxSelectIinit() {
    console.log(category);
    var checkboxes = document.getElementsByClassName("checkbox");
    var selectedCheckboxes = [];
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener("change", function () {
            selectedCheckboxes = [];
            for (var j = 0; j < checkboxes.length; j++) {
                var checkbox = checkboxes[j];
                if (checkbox.checked) {
                    selectedCheckboxes.push(checkbox.value);
                }
            }
            category = selectedCheckboxes.join(",");
            console.log(category);
            loadFilterQus()
        });
    }
}


yearSelect.addEventListener('change', (event) => {
    year = event.target.value;
    previousData = [];
    offset = 0;
    loadFilterQus()
});





//fetch the questions
function loadFilterQus() {
    let fetchURL = `/combined-question/view-questions?year=${year}&category=${category}&class_id=${class_id}&subject_id=${subject_id}&chapter=${chapter}&q_set=${q_set}&q_type=${q_type}`
    window.location.href = fetchURL
}




//some unitily functions
function createFilterElement(filter_data, category) {
    const board = document.querySelector('.board');
    const uni = document.querySelector('.uni');

    const filterArray = JSON.parse(filter_data);
    const categoryArray = category.split(',');
    console.log(categoryArray);

    filterArray.forEach((item, index) => {
        // Create the checkbox element
        const checkbox = document.createElement('input');
        checkbox.className = 'form-check-input checkbox';
        checkbox.name = 'filter';
        checkbox.type = 'checkbox';
        checkbox.value = item.id;
        console.log(item.id);
        if (categoryArray.includes(item.id.toString())) {
            checkbox.checked = true;
        }

        checkbox.id = item.id;

        // Create the label element
        const label = document.createElement('label');
        label.className = 'form-check-label';
        label.htmlFor = item.id;
        label.textContent = item.name;

        // Create the div container for checkbox and label
        const divContainer = document.createElement('div');
        divContainer.className = 'form-check';

        // Append checkbox and label to the div container
        divContainer.appendChild(checkbox);
        divContainer.appendChild(label);


        if (item.type === 'board') {
            // Append the div container to the main container
            board.appendChild(divContainer);
        } else {
            uni.appendChild(divContainer);
        }
    });
}