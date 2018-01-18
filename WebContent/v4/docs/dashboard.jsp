<%--
Created by IntelliJ IDEA.
User: eiyasushiki
Date: 11/28/17
Time: 1:19 AM
To change this template use File | Settings | File Templates.
--%>
<div class="col-md-3 sidebar">
    <nav class="sidebar-nav">
        <div class="sidebar-header">
            <button class="nav-toggler nav-toggler-md sidebar-toggler" type="button" data-toggle="collapse" data-target="#nav-toggleable-md">
                <span class="sr-only">Toggle nav</span>
            </button>
            <a class="sidebar-brand img-responsive" href="check_balance.do">
                <img src="logo.png" style="width: 200px; height: auto;">
            </a>
        </div>

        <div class="collapse nav-toggleable-md" id="nav-toggleable-md">
            <form class="sidebar-form">
                <input class="form-control" type="text" placeholder="Search...">
                <button type="submit" class="btn-link">
                    <span class="icon icon-magnifying-glass"></span>
                </button>
            </form>
            <ul class="nav nav-pills nav-stacked flex-column">
                <li class="nav-header">Dashboards</li>
                <li class="nav-item">
                    <a class="nav-link" href="check_balance.do">Overview</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="transfer.jsp">Transfer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="deposit.jsp">Deposit</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="bill.do">Loans</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="update_profile.do">Customer Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="explore_transactions.do">Transaction History</a>
                    <a class="nav-link" href="ManageUtilities.jsp">Pay Bills</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.do">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
</div>
