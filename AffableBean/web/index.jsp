<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : May 23, 2016, 3:01:34 PM
    Author     : Max
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div style="height: 521px; width: 100%">
    <div id="typerow">
        <c:forEach var="type" items="${types}">
            <div class="typeBox">
                <a href="type?${type.id}"> <%--TODO: CHANGE LINK--%>
                    <img src="${initParam.typesImagePath}${type.id}.png"
                         alt="${type.name}" class="typeImage">
                </a>
            </div>
        </c:forEach>
    </div>
    <div id="wildPokemonTitle">
        <h1>Wild Pokémon appeared!</h1>
    </div>
    <div id="wildPokemonRow">
        <div id="wildPokemonInfo">
            <div style="margin-left: 20px; margin-top: 20px;">
                <h2>${randPokemon.name}</h2>
                
                <div class="pokemonLeft">
                    <text><strong>Hp: </strong></text>
                    <br/>
                    <text><strong>Attack: </strong></text>
                    <br/>
                    <text><strong>Defense: </strong></text>
                </div>
                <div class="pokemonMiddle">
                    <text>${randPokemon.hp}</text>
                    <br/>
                    <text>${randPokemon.attack}</text>
                    <br/>
                    <text>${randPokemon.defense}</text>
                </div>
                <div class="pokemonRight">
                    <text style="visibility: hidden">1</text><progress style="width: 355px" max="250" value="${randPokemon.hp}"></progress>
                    <br/>
                    <text style="visibility: hidden">1</text><progress style="width: 355px" max="134" value="${randPokemon.attack}"></progress>
                    <br/>
                    <text style="visibility: hidden">1</text><progress style="width: 355px" max="180" value="${randPokemon.defense}"></progress>
                </div>
                
    
                <div id="wildPokemonTyperow">
                    <c:forEach var="type" items="${randPokemonTypes}">
                        <div class="typeBox">
                            <img src="${initParam.typesImagePath}${type.id}.png"
                                 alt="${type.name}" class="typeImage" id="wildPokemonImg">
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        
                <script>
                    var svg = d3.select('#wildPokemonRow')
                            .append('svg')
                            .attr('width','211')
                            .attr('height','211');
                    
                    svg.append('image')
                            .attr('id','wildPokemon')
                            .attr("xlink:href", "${initParam.pokemonImagePath}${randPokemon.id}.png")
                            .attr('width','192')
                            .attr('height','192');
                    
                    svg.append('image')
                            .attr('id','thrownPokeball')
                            .attr("xlink:href", "img/Pokeball.png")
                            .attr('width','20')
                            .attr('height','20')
                            .attr('x', '86')
                            .attr('y', '172')
                            .style('visibility', 'hidden');
                </script>        
                
                
<!--        <div id="wildPokemonImageholder">
            <img src="${initParam.pokemonImagePath}${randPokemon.id}.png"
                     alt="${randPokemon.name}" class="wildPokemonImage"/>
        </div>-->
    </div>
    <div id="trainerRow">
        <div id="trainerImageholder">
            <img src="img/trainer.png"
                     alt="${randPokemon.name}" class="wildPokemonImage">
        </div>
        <div id="trainerAction">
            <form style="visibility: hidden" id="catchForm" action="addToCart" method="post">
                <input type="hidden"
                       name="pokemonId"
                       value="${randPokemon.id}">
                <input type="submit"
                       name="btnSubmit"
                       value="Catch Pokemon">
            </form>
            <button id="catchButton" >vang</button>
            
            <a href="randomPokemon">
                <button id="scareButton">Scare away</button>
            </a>
        </div>
    </div>
</div>
                
                <script>
                    var form = document.getElementById("catchForm");
                    var btn = document.getElementById("scareButton");
                    
                    d3.select("#catchButton").on("click",function () {
                        //Generate random int to see if the pokemon ran away
                        var randomInt = Math.floor((Math.random() * 1000) + 1);
                        
                        d3.select("#wildPokemon")
                                .transition()
                                .duration(400)
                                .attr('width','20')
                                .attr('height','20')
                                .attr("transform", "translate(86 , 86)");
                        
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
                                .duration(50)
                                .attr("transform", "translate(-86 , -172) rotate(0)")
                                .each("end", function(){
                                    if(randomInt >= ${randPokemon.total}){
                                        form.submit();
                                    }
                                    else {
                                        d3.select("#wildPokemon")
                                            .transition()
                                            .duration(400)
                                            .attr('width','192')
                                            .attr('height','192')
                                            .attr("transform", "translate(0 , 0)");

                                        d3.select("#thrownPokeball")
                                            .transition()
                                            .duration(400)
                                            .attr('width','20')
                                            .attr('height','20')
                                            .attr("transform", "translate(0 , 0)")
                                            .transition()
                                            .delay(400)
                                            .style('visibility', 'hidden')
                                            .each("end", function(){
                                               btn.click(); 
                                            });
                                    }
                                });
                        
                        
                        
                    });
                    
                </script>