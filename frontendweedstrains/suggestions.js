console.log("hi");

fetch("http://localhost:3000/joiners")
  .then((response) => response.json())
  .then((strains) => {
    strains.forEach((strain) => {
      let section = document.querySelector("#strain-cards")
      let card = document.createElement("div")
      let name = document.createElement("h2")
      let category = document.createElement("h3")
      let flavors = document.createElement("h4")
      let positive_effects = document.createElement("p")
      let medical_effects = document.createElement("p")
      let negative_effects = document.createElement("p")
      // let strainCard = document.querySelector(".strain-card")

      card.classList.add("strain-card")
      name.textContent = strain.name
      category.textContent = strain.race
      flavors.textContent = "Flavors: " + strain.flavors
      positive_effects.textContent = "Positive Effects: " + strain.positive_effects
      medical_effects.textContent = "Medical Effects: " + strain.medical_effects
      negative_effects = "Negative Effects: " + strain.negative_effects
      
      card.append(name, category, flavors, positive_effects, medical_effects, negative_effects)
      section.append(card)
    });
  });
