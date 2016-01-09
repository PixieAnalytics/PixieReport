$.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: window.location + '/data',
           dataType: 'json',
           success: function (data) {
               draw_duration(data.duration);
               draw_cities(data.cities)
               draw_links(data.links)
           },
           error: function (result) {
              console.log(result)
               // error();
           }
       });
function draw_duration(values) {
    // console.log(data)
    var values = values;

// A formatter for counts.
var formatCount = d3.format(",.0f");

var margin = {top: 10, right: 30, bottom: 30, left: 30},
    width = 500 - margin.left - margin.right,
    height = 300 - margin.top - margin.bottom;

var x = d3.scale.linear()
    .domain([0, 60])
    .range([0, width]);

// Generate a histogram using twenty uniformly-spaced bins.
var data = d3.layout.histogram()
    .bins(x.ticks(20))
    (values);

var y = d3.scale.linear()
    .domain([0, d3.max(data, function(d) { return d.y; })])
    .range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

// var yAxis = d3.svg.axis()
//     .scale(y)
//     .orient("left")

var svg = d3.select("#duration_chart").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

var bar = svg.selectAll(".bar")
    .data(data)
  .enter().append("g")
    .attr("class", "bar")
    .attr("transform", function(d) { return "translate(" + x(d.x) + "," + y(d.y) + ")"; });

bar.append("rect")
    .attr("x", 1)
    .attr("width", x(data[0].dx) - 1)
    .attr("height", function(d) { return height - y(d.y); });

bar.append("text")
    .attr("dy", ".75em")
    .attr("y", 3)
    .attr("x", x(data[0].dx) / 2)
    .attr("text-anchor", "middle")
    .text(function(d) { return formatCount(d.y); });

svg.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")")
    .call(xAxis);
}

function draw_cities(data){
  var w = 400
  var h = 400
  var r = 180
  var color = d3.scale.category20c()
  var data = data
  var vis = d3.select('#cities_chart').append("svg:svg").data([data]).attr("width", w).attr("height", h).append("svg:g").attr("transform", "translate("+r+","+r+")");
  var pie = d3.layout.pie().value(function(d){return d.value})
  var arc = d3.svg.arc().outerRadius(r).innerRadius(30)

  var arcs = vis.selectAll("g.slice").data(pie).enter().append("svg:g").attr("class", "slice");
  arcs.append("svg:path").attr("fill", function(d,i){
    return color(i)
  }).attr("d", function(d){
    console.log(arc(d))
    return arc(d)
  })

  arcs.append("svg:text").attr("transform", function(d){
    d.innerRadius = 30;
    d.outerRadius = r
    return "translate(" + arc.centroid(d) + ")"
  }).attr("text-anchor", "outer").text(function(d,i){
    return data[i].label
  })
}
function draw_links(data){
  var w = 400
  var h = 400
  var r = 180
  var color = d3.scale.category20c()
  var data = data
  var vis = d3.select('#links_chart').append("svg:svg").data([data]).attr("width", w).attr("height", h).append("svg:g").attr("transform", "translate("+r+","+r+")");
  var pie = d3.layout.pie().value(function(d){return d.value})
  var arc = d3.svg.arc().outerRadius(r).innerRadius(30)

  var arcs = vis.selectAll("g.slice").data(pie).enter().append("svg:g").attr("class", "slice");
  arcs.append("svg:path").attr("fill", function(d,i){
    return color(i)
  }).attr("d", function(d){
    console.log(arc(d))
    return arc(d)
  })

  arcs.append("svg:text").attr("transform", function(d){
    d.innerRadius = 30;
    d.outerRadius = r
    return "translate(" + arc.centroid(d) + ")"
  }).attr("text-anchor", "middle").text(function(d,i){
    return data[i].label
  })
}
