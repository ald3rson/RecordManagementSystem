<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to RMS</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>

    <div class="svg" role="presentation">
        
    </div>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <br>
            <br>
            <br>
            <br>
            <h1>Welcome to Record Management System</h1>
<div class="container">
    <div class="row">

        <div class="col-md-6">
            <a href="${createLink(controller: 'delivery',action: 'index')}">
                <button type="button" class="btn btn-labeled btn-primary btn-lg btn-block p-5" style="font-size:500%;">
                    <span class="btn-label"><i class="glyphicon glyphicon-envelope"></i>
                    </span>Delivery
                </button>
            </a>
        </div>
        <div class="col-md-6">
            <a href="${createLink(controller: 'city',action: 'index')}">
                <button type="button" class="btn btn-labeled btn-success btn-lg btn-block p-5" style="font-size:500%;">
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
                <button type="button" class="btn btn-labeled btn-warning btn-lg btn-block p-5" style="font-size:500%;">
                    <span class="btn-label"><i class="glyphicon glyphicon-lock"></i>
                    </span>Bureau
                </button>
            </a>
        </div>
        <div class="col-md-6">
            <a href="${createLink(controller: 'remarks',action: 'index')}">
                <button type="button" class="btn btn-labeled btn-danger btn-lg btn-block p-5" style="font-size:500%;">
                    <span class="btn-label"><i class="glyphicon glyphicon-bookmark"></i>
                    </span>Remarks
                </button>
            </a>
        </div>                
    </div>
</div>

        </section>
    </div>

</body>
</html>
