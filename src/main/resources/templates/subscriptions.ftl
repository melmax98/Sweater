<#import "parts/common.ftl" as c>

<@c.page>
    <h3>${userChannel.getUsername()}</h3>
    <div>${type}</div>
    <ul class="list-group">
        <#list users as user>
        <li class="list-group-item">
            <a href="/user-messages/${user.getId()}">${user.getUsername()}</a>
        </li>
        </#list>
    </ul>
</@c.page>