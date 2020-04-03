<%@ page import="doe.gov.ph.Certificate" %>
<% tecList = Certificate.createCriteria().list(params) { type { eq ("typeName", "TEC") } } %>
<% tec = tecList.totalCount %>
<% coeList = Certificate.createCriteria().list(params) { type { eq ("typeName", "COE") } } %>
<% coe = coeList.totalCount %>
<% dfcList = Certificate.createCriteria().list(params) { type { eq ("typeName", "DFC") } } %>
<% dfc = dfcList.totalCount %>
<% countTec = Certificate.todaysTec.count() %>
<% countCoe = Certificate.todaysCoe.count() %>
<% countDfc = Certificate.todaysDfc.count() %>

<%@ page import="doe.gov.ph.Delivery" %>
<% one = Delivery.createCriteria().list(params) { eq ("remarks", "DELIVERED") } %>
<% onecount = one.totalCount %>
<% two = Delivery.createCriteria().list(params) { eq ("remarks", "MOVED OUT") } %>
<% twocount = two.totalCount %>
<% four = Delivery.createCriteria().list(params) { eq ("remarks", "RETURN TO SENDER") } %>
<% fourcount = four.totalCount %>
<% nine = Delivery.createCriteria().list(params) { eq ("remarks", "FOR MAILING") } %>
<% ninecount = nine.totalCount %>
<% eleven = Delivery.createCriteria().list(params) { eq ("remarks", "UNKNOWN ADDRESSEE") } %>
<% elevencount = eleven.totalCount %>
<% twelve = Delivery.createCriteria().list(params) { eq ("remarks", "WRONG ADDRESS") } %>
<% twelvecount = twelve.totalCount %>
<% thirteen = Delivery.createCriteria().list(params) { eq ("remarks", "PICK-UP") } %>
<% thirteencount = thirteen.totalCount %>


<% 
    def now = new Date().clearTime().format('MM/dd/yyyy')
    def posts = Delivery.createCriteria().list(params) {
        eq('date', now)
        lt('date', now+1)
    }
%>
<% todaysPost = posts.totalCount %>


<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to RMS</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
<div id="content" role="main">
    <section class="row colset-2-its">
    <h1>Welcome to Record Management System<% countTec %></h1>
    <div class="container">
        <sec:ifAnyGranted roles="ROLE_USER">
        <div class="row">
            <div  class="col-md-6">
            <canvas id="myChart1"  height="330%"></canvas>
            </div>
            <div  class="col-md-6">
            <button type="button" class="btn btn-labeled btn-success btn-lg btn-block" style="font-size:100%;">Transaction/s</button>
            <button type="button" class="btn btn-labeled btn-success btn-lg btn-block" style="font-size:1400%;"><% println todaysPost %></button>
            </div>
            <script>
                var ctx1 = document.getElementById('myChart1').getContext('2d');
                var originalStroke = ctx1.stroke;
                ctx1.stroke = function () {
                    ctx1.save();
                    ctx1.shadowColor = '#000';
                    ctx1.shadowBlur = 10;
                    ctx1.shadowOffsetX = 8;
                    ctx1.shadowOffsetY = 8;
                    originalStroke.apply(this, arguments)
                    ctx1.restore();
                }
                var myChart1 = new Chart(ctx1, {
                    type: 'pie',
                    data: {
                        labels: ['Delivered', 'Moved Out', 'Return to Sender', 'For Mailing', 'Unknown Addressee', 'Wrong Address', 'Pick-Up'],
                        datasets: [{
                            label: '# of Delivery',
                            data: ['<%= onecount %>', '<%= twocount %>','<%= fourcount %>', '<%= ninecount %>', '<%= elevencount %>', '<%= twelvecount %>', '<%= thirteencount %>'],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });
            </script>
        </div>
        <br>        
            <div class="row">
                <div class="col-md-6">
                    <a href="${createLink(controller: 'delivery',action: 'index')}">
                        <button type="button" class="btn btn-labeled btn-primary btn-lg btn-block p-5" style="font-size:400%;">
                            <span class="btn-label"><i class="glyphicon glyphicon-envelope"></i>
                            </span>Delivery
                        </button>
                    </a>
                </div>
                <div class="col-md-6">
                    <a href="${createLink(controller: 'city',action: 'index')}">
                        <button type="button" class="btn btn-labeled btn-success btn-lg btn-block p-5" style="font-size:400%;">
                            <span class="btn-label"><i class="glyphicon glyphicon-road"></i>
                            </span>City
                        </button>
                    </a>
                </div>
            </div>
                <br>
            <div class="row">
                <div class="col-md-6">
                    <a href="${createLink(controller: 'bureau',action: 'index')}">
                        <button type="button" class="btn btn-labeled btn-warning btn-lg btn-block p-5" style="font-size:400%;">
                            <span class="btn-label"><i class="glyphicon glyphicon-lock"></i>
                            </span>Bureau
                        </button>
                    </a>
                </div>
                <div class="col-md-6">
                    <a href="${createLink(controller: 'remarks',action: 'index')}">
                        <button type="button" class="btn btn-labeled btn-danger btn-lg btn-block p-5" style="font-size:400%;">
                            <span class="btn-label"><i class="glyphicon glyphicon-bookmark"></i>
                            </span>Remarks
                        </button>
                    </a>
                </div>  
            </div>
        </sec:ifAnyGranted>              
        <sec:ifAnyGranted roles="ROLE_ADMIN">
        <div class="row">
            <div  class="col-md-6">
                <canvas id="myChart3" width="200" height="450"></canvas>
            </div>
            <div  class="col-md-6">
                <canvas id="myChart4" width="200" height="450"></canvas>
            </div>
            <script>
                var ctx3 = document.getElementById('myChart3').getContext('2d');
                var originalStroke3 = ctx3.stroke;
                ctx3.stroke = function () {
                    ctx3.save();
                    ctx3.shadowColor = '#000';
                    ctx3.shadowBlur = 10;
                    ctx3.shadowOffsetX = 8;
                    ctx3.shadowOffsetY = 8;
                    originalStroke3.apply(this, arguments)
                    ctx3.restore();
                }
                var myChart3 = new Chart(ctx3, {
                    type: 'bar',
                    data: {
                        labels: ['TEC', 'COE', 'DFC'],
                        datasets: [{
                            label: 'Bar Dataset',
                            data: ['<%= tec %>', '<%= coe %>', '<%= dfc %>'],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)'
                            ],
                        }, {
                            label: 'Line Dataset',
                            data: ['<%= tec %>', '<%= coe %>', '<%= dfc %>'],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)'
                            ],
                            type: 'line'
                            }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });

                var ctx4 = document.getElementById('myChart4').getContext('2d');
                var originalStroke4 = ctx4.stroke;
                ctx4.stroke = function () {
                    ctx4.save();
                    ctx4.shadowColor = '#000';
                    ctx4.shadowBlur = 10;
                    ctx4.shadowOffsetX = 8;
                    ctx4.shadowOffsetY = 8;
                    originalStroke4.apply(this, arguments)
                    ctx4.restore();
                }
                var myChart4 = new Chart(ctx4, {
                    type: 'doughnut',
                    data: {
                        labels: ['TEC', 'COE', 'DFC'],
                        datasets: [{
                            label: '# of Post',
                            data: ['<%= countTec %>', '<%= countCoe %>', '<%= countDfc %>'],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });
            </script>
        </div>
        <br>
            <div class="row">
                <div class="col-md-4">
                    <a href="${createLink(controller: 'certificate',action: 'index')}">
                        <button type="button" class="btn btn-labeled btn-primary btn-lg btn-block p-5" style="font-size:200%;">
                            <span class="btn-label"><i class="glyphicon glyphicon-envelope"></i>
                            </span>TEC LIST
                        </button>
                    </a>
                </div>
     
   
  
                <div class="col-md-4">
                    <a href="${createLink(controller: 'certificate',action: 'index2')}">
                        <button type="button" class="btn btn-labeled btn-success btn-lg btn-block p-5" style="font-size:200%;">
                            <span class="btn-label"><i class="glyphicon glyphicon-road"></i>
                            </span>COE LIST
                        </button>
                    </a>
                </div>
 
       
       
                    <div class="col-md-4">
                        <a href="${createLink(controller: 'certificate',action: 'index3')}">
                            <button type="button" class="btn btn-labeled btn-warning btn-lg btn-block p-5" style="font-size:200%;">
                                <span class="btn-label"><i class="glyphicon glyphicon-lock"></i>
                                </span>DFC LIST
                            </button>
                        </a>
                    </div>
                </div>
            </div>
        </sec:ifAnyGranted>         
    </div>
    </section>
</div>



</body>
</html>
