document.addEventListener('turbolinks:load', function() {
  
  var firstPass = document.querySelector('#rule_type_first_pass')
  var categoryPassed = document.querySelector('#rule_type_category_passed')
  var levelPassed = document.querySelector('#rule_type_level_passed')
  
  if (firstPass){
    firstPass.addEventListener('change', funkFirstPass) 
  }
  if (categoryPassed){
    funkCategoryPassed()
    categoryPassed.addEventListener('click', funkCategoryPassed) 
  }
  if (levelPassed){
    levelPassed.addEventListener('click', funkLevelPassed) 
  }
  
  
})

function funkFirstPass(event){
  var categoryPassedForm = document.querySelector('#category_passed')
  var firstPassForm = document.querySelector('#first_pass')
  var levelPassedForm = document.querySelector('#level_passed')
  
  categoryPassedForm.classList.add('hide')
  levelPassedForm.classList.add('hide')
  firstPassForm.classList.remove('hide')

  var ruleValueForm = document.querySelector('#rule_value')
  firstPassForm.addEventListener('change', function(){
    ruleValueForm.value = document.querySelector('#badge_first_pass').value
  })
}


function funkCategoryPassed(event){
  var categoryPassedForm = document.querySelector('#category_passed')
  var firstPassForm = document.querySelector('#first_pass')
  var levelPassedForm = document.querySelector('#level_passed')
  
  categoryPassedForm.classList.remove('hide')
  levelPassedForm.classList.add('hide')
  firstPassForm.classList.add('hide')
  
  var ruleValueForm = document.querySelector('#rule_value')
  categoryPassedForm.addEventListener('change', function(){
    ruleValueForm.value = document.querySelector('#badge_category_passed').value
  })
}

function funkLevelPassed(event){
  var categoryPassedForm = document.querySelector('#category_passed')
  var firstPassForm = document.querySelector('#first_pass')
  var levelPassedForm = document.querySelector('#level_passed')

  categoryPassedForm.classList.add('hide')
  levelPassedForm.classList.remove('hide')
  firstPassForm.classList.add('hide')

  var ruleValueForm = document.querySelector('#rule_value')
  levelPassedForm.addEventListener('input', function(){
    ruleValueForm.value = document.querySelector('#badge_level_passed').value
  })
}