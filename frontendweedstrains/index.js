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
    console.log(positiveEffects);
    console.log(medicalEffects);
    console.log(negativeEffects);
    showEffects(effects);
  });

function filterPositiveEffects(effects) {
  effects.forEach((effect) => {
    if (effect.type == "positive") {
      positiveEffects.push(effect);
    }
  });
}

function filterMedicalEffects(effects) {
  effects.forEach((effect) => {
    if (effect.type == "medical") {
      medicalEffects.push(effect);
    }
  });
}

function filterNegativeEffects(effects) {
  effects.forEach((effect) => {
    if (effect.type == "negative") {
      negativeEffects.push(effect);
    }
  });
}

function showEffects(effects) {
  effects.map((effect) => {
    let option = document.createElement("input");
    let label = document.createElement("label");
    let effectsection = document.querySelector("#fieldset");
    let linebreak = document.createElement("br");
    option.classList.add("selectableEffect");
    option.type = "checkbox";
    label = effect["effect"];
    effectsection.append(option);
    effectsection.append(label);
    effectsection.append(linebreak);
  });
}
