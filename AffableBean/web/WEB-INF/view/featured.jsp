<%@page contentType="text/html" pageEncoding="UTF-8"%>
              
<div id="wildPokemonTitle">
    <h1 id="wildPokemonTitleText">Featured Pokémons are easier to catch!</h1>
</div>
<div style="margin-top: 100px">
    <div id="wildPokemonRow">
        <div id="wildPokemonInfo">
            <div style="margin-left: 20px; margin-top: 20px;">
                <h2>${featuredPokemon.name}</h2>

                <div class="pokemonLeft">
                    <text><strong>Hp: </strong></text>
                    <br/>
                    <text><strong>Attack: </strong></text>
                    <br/>
                    <text><strong>Defense: </strong></text>
                </div>
                <div class="pokemonMiddle">
                    <text style="font-size: 14px">${featuredPokemon.hp}</text>
                    <br/>
                    <text style="font-size: 14px">${featuredPokemon.attack}</text>
                    <br/>
                    <text style="font-size: 14px">${featuredPokemon.defense}</text>
                </div>
                <div class="pokemonRight">
                    <progress style="width: 320px" max="250" value="${featuredPokemon.hp}"></progress>
                    <br/>
                    <progress style="width: 320px" max="134" value="${featuredPokemon.attack}"></progress>
                    <br/>
                    <progress style="width: 320px" max="180" value="${featuredPokemon.defense}"></progress>
                    <br/>
                </div>


                <div id="wildPokemonTyperow" style="width:100%;">
                    <c:forEach var="type" items="${featuredPokemon.getTypeCollection()}">
                        <div class="typeBox">
                            <img src="${initParam.typesImagePath}${type.id}.png"
                                 alt="${type.name}" class="typeImage" id="wildPokemonImg">
                        </div>
                    </c:forEach>
                </div>
                <div class="pokemonLeft">
                    <text><strong>Chance: </strong></text>
                </div>
                <div class="pokemonMiddle">
                    <text id="catchChance" style="font-size: 14px">  </text>
                </div>
                <div class="pokemonRight">
                    <progress id="chanceBar2" style="width: 320px" max="100"></progress>
                    <br/>
                </div>
                <script>
                    var chance =100 - Math.round(${(featuredPokemon.total - 195) / 12.10});

                    d3.select("#catchChance")
                        .text(function(){
                            return (chance + "%");
                        });

                    d3.select("#chanceBar2")
                        .attr('value', chance);
                </script>
            </div>
        </div>

        <script>
            var svg = d3.select('#wildPokemonRow')
                    .append('svg')
                    .attr('width','211')
                    .attr('height','211');

            svg.append('image')
                    .attr('id','wildPokemon')
                    .attr("xlink:href", "${initParam.pokemonImagePath}${featuredPokemon.id}.png")
                    .attr('width','192')
                    .attr('height','192');
            svg.append('image')
                    .attr('id','ribbon')
                    .attr("xlink:href", "img/featured.png")
                    .attr('width','130')
                    .attr('height','40')
                    .attr('y', '155')
                    .attr('x', '-1');

            svg.append('image')
                    .attr('id','thrownPokeball')
                    .attr("xlink:href", "img/Pokeball.png")
                    .attr('width','20')
                    .attr('height','20')
                    .attr('x', '86')
                    .attr('y', '172')
                    .style('visibility', 'hidden');
            
            
        </script>    
    </div>
    <div id="trainerRow">
        <div id="trainerImageholder">
            <img src="img/trainer.png"
                     alt="trainer" class="wildPokemonImage">
        </div>
        <div id="trainerAction">
            <form style="visibility: hidden; height: 10%" id="catchForm" action="addToCart" method="post">
                <input type="hidden"
                       name="pokemonId"
                       value="${featuredPokemon.id}">
                <input type="submit"
                       name="btnSubmit"
                       value="Catch Pokemon">
            </form>
            <div width="100%" style="margin-top: 35px; margin-left: 30px;">

                <h2 id="catchButton">
                    <img id="catchArrow" style="visibility: hidden; height: 35px ; margin-right: 10px; padding-bottom: -10px" src="img/arrow.png" alt="arrow">
                    Trow POKé BALL
                </h2>
            </div>
            <div width="100%" style="margin-left: 30px; margin-top: -10px;">
                <a id="scareButton" href="randomPokemon">
                    <h2>
                        <img id="scareArrow" style="visibility: hidden; height: 35px ; margin-right: 10px; padding-bottom: -10px" src="img/arrow.png" alt="arrow">
                        Run
                    </h2>
                </a>
            </div>
        </div>
    </div>
</div>
<script>
    var form = document.getElementById("catchForm");
    var btn = document.getElementById("scareButton");
    
    d3.select("#scareButton")
            .on("mouseover",function(){
                d3.select('#scareArrow')
                    .style('cursor', 'pointer')
                    .style('visibility', 'visible');
            })
            .on("mouseout",function(){
                d3.select('#scareArrow')
                    .style('visibility', 'hidden');
            })

    d3.select("#catchButton")
            .on("mouseover",function(){
                d3.select('#catchArrow')
                    .style('visibility', 'visible');
            })
            .on("mouseout",function(){
                d3.select('#catchArrow')
                    .style('visibility', 'hidden');
            })
            .on("click",function () {
        //Generate random int to see if the pokemon ran away
        var randomInt = Math.floor((Math.random() * 1210) + 1);

        d3.select("#wildPokemon")
                .transition()
                .duration(400)
                .attr('width','20')
                .attr('height','20')
                .attr("transform", "translate(86 , 86)");
        d3.select("#ribbon")
                .transition()
                .duration(400)
                .attr('width','20')
                .attr('height','20')
                .attr("transform", "translate(86 , -86)");

        d3.select("#thrownPokeball")
                .transition()
                .duration(400)
                .style('visibility', 'visible')
                .attr('width','192')
                .attr('height','192')
                .attr("transform", "translate(-86 , -172)")

                .transition()
                .delay(400)
                .duration(300)
                .attr("transform", "translate(86 , -172) rotate(45 96 96)")                            
                .transition()
                .delay(710)
                .duration(300)
                .attr("transform", "translate(-86 , -172) rotate(0)")

                .transition()
                .delay(1110)
                .duration(300)
                .attr("transform", "translate(86 , -172) rotate(45 96 96)")                            
                .transition()
                .delay(1420)
                .duration(300)
                .attr("transform", "translate(-86 , -172) rotate(0)")

                .transition()
                .delay(1730)
                .duration(300)
                .attr("transform", "translate(86 , -172) rotate(45 96 96)")                            
                .transition()
                .delay(2040)
                .duration(300)
                .attr("transform", "translate(-86 , -172) rotate(0)")

                .transition()
                .delay(2140)
                .duration(100)
                .attr("transform", "translate(-86 , -172) rotate(0)")
                .each("end", function(){
                    if(randomInt >= ${randPokemon.total - 195}){
                        form.submit();
                    }
                    else {
                        d3.select("#wildPokemon")
                            .transition()
                            .duration(400)
                            .attr('width','192')
                            .attr('height','192')
                            .attr("transform", "translate(0 , 0)");
                        d3.select("#ribbon")
                            .transition()
                            .duration(400)
                            .attr('width','130')
                            .attr('height','40')
                            .attr("transform", "translate(0 , 0)");

                        d3.select("#thrownPokeball")
                            .transition()
                            .duration(400)
                            .attr('width','20')
                            .attr('height','20')
                            .attr("transform", "translate(0 , 0)")
                            .transition()
                            .delay(400)
                            .style('visibility', 'hidden');
                    
                        d3.select("#wildPokemon")
                            .transition()
                            .delay(400)
                            .duration(400)
                            .attr("transform", "translate(250 , 0)")
                            .each("end", function(){
                               btn.click(); 
                            });
                        d3.select("#ribbon")
                        .transition()
                        .delay(400)
                        .duration(400)
                        .attr("transform", "translate(250 , 0)");
                    }
                });



    });

</script>