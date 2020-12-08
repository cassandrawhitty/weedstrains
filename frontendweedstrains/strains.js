console.log("strains");

const searchParams = new URLSearchParams(window.location.search);

const search = searchParams.get("search");

fetch(`http://localhost:3000/strains?search=${search}`)
  .then((response) => response.json())
  .then((strains) => {
    strains.forEach((strain) => {
      console.log(strain);
      let section = document.querySelector("#strain-cards");
      let card = document.createElement("div");
      let name = document.createElement("h2");
      let category = document.createElement("h3");
      let cardHead = document.createElement("div");
      let flavors = document.createElement("h4");
      let positive_effects = document.createElement("p");
      let medical_effects = document.createElement("p");
      let negative_effects = document.createElement("p");
      // let strainCard = document.querySelector(".strain-card")
      cardHead.classList.add("card-head");

      card.classList.add("strain-card");
      name.textContent = strain.name;
      category.textContent = strain.race.toUpperCase();
      flavors.textContent = "Flavors: " + JSON.parse(strain.flavor);
      positive_effects.textContent =
        "Positive Effects: " + JSON.parse(strain.positive_effects);
      medical_effects.textContent =
        "Medical Effects: " + JSON.parse(strain.medical_effects);
      negative_effects =
        "Negative Effects: " + JSON.parse(strain.negative_effects);

      cardHead.append(name, category);

      card.append(
        cardHead,
        flavors,
        positive_effects,
        medical_effects,
        negative_effects
      );
      section.append(card);
    });
  });
