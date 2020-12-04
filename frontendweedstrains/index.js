const APIKey = "4nX8ujH";

// fetch(`http://strainapi.evanbusse.com/${APIKey}/strains/search/all`)
//   .then((response) => response.json())
//   .then((strains) => {
//     showStrains(strains);
//   });

// function showStrains(strains) {
//   console.log(strains);
// }

let positiveEffects = [];
let medicalEffects = [];
let negativeEffects = [];

let effectsURL = `http://strainapi.evanbusse.com/${APIKey}/searchdata/effects`;
fetch(effectsURL)
  .then((response) => response.json())
  .then((effects) => {
    filterPositiveEffects(effects);
    filterMedicalEffects(effects);
    filterNegativeEffects(effects);
    showPositiveEffects(positiveEffects);
    showMedicalEffects(medicalEffects);
    showNegativeEffects(negativeEffects);
  });

function filterPositiveEffects(effects) {
  effects.forEach((effect) => {
    if (effect.type == "positive") {
      positiveEffects.push(effect);
    }
  });
}

function showPositiveEffects(positiveEffects) {
  let positiveDiv = document.querySelector("#positive-div");
  let effectsection = document.querySelector("#fieldset");

  positiveEffects.forEach((effect) => {
    let option = document.createElement("input");
    let label = document.createElement("label");
    let linebreak = document.createElement("br");
    option.classList.add("selectableEffect");
    option.type = "checkbox";
    label = effect["effect"];
    option.setAttribute("name", label);
    option.id = label;
    positiveDiv.append(option);
    positiveDiv.append(label);
    positiveDiv.append(linebreak);
  });
  effectsection.append(positiveDiv);
}

function filterMedicalEffects(effects) {
  effects.forEach((effect) => {
    if (effect.type == "medical") {
      medicalEffects.push(effect);
    }
  });
}

function showMedicalEffects(medicalEffects) {
  let medicalDiv = document.querySelector("#medical-div");
  let effectsection = document.querySelector("#fieldset");

  medicalEffects.forEach((effect) => {
    let option = document.createElement("input");
    let label = document.createElement("label");
    let linebreak = document.createElement("br");
    option.classList.add("selectableEffect");
    option.type = "checkbox";
    label = effect["effect"];
    option.setAttribute("name", label);
    option.id = label;
    medicalDiv.append(option);
    medicalDiv.append(label);
    medicalDiv.append(linebreak);
  });
  effectsection.append(medicalDiv);
}

function filterNegativeEffects(effects) {
  effects.forEach((effect) => {
    if (effect.type == "negative") {
      negativeEffects.push(effect);
    }
  });
}

function showNegativeEffects(negativeEffects) {
  let negativeDiv = document.querySelector("#negative-div");
  let effectsection = document.querySelector("#fieldset");

  negativeEffects.forEach((effect) => {
    let option = document.createElement("input");
    let label = document.createElement("label");
    let linebreak = document.createElement("br");
    option.classList.add("selectableEffect");
    option.type = "checkbox";
    label = effect["effect"];
    option.setAttribute("name", `negative${label}`);
    option.id = label;
    negativeDiv.append(option);
    negativeDiv.append(label);
    negativeDiv.append(linebreak);
  });
  effectsection.append(negativeDiv);
}

// function showEffects(effects) {
//   effects.map((effect) => {
//     let option = document.createElement("input");
//     let label = document.createElement("label");
//     let effectsection = document.querySelector("#fieldset");
//     let linebreak = document.createElement("br");
//     option.classList.add("selectableEffect");
//     option.type = "checkbox";
//     label = effect["effect"];
//     effectsection.append(option);
//     effectsection.append(label);
//     effectsection.append(linebreak);
//   });
// }

const params = new URLSearchParams(window.location.search);
console.log(params);
let mySearchParams = params.get();
// console.log(params);
