console.log("hi");

fetch("http://localhost:3000/joiners")
  .then((response) => response.json())
  .then((strains) => {
    strains.forEach((strain) => {
      let h2 = document.createElement("h2");
    });
  });
