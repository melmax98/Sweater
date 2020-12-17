<#include "security.ftl">
<#import "pager.ftl" as p>

<@p.pager url page />

<div class="card-columns" id="message-list">
    <#list page.content as message>
        <div class="card my-3" data-id="${message.getId()}">
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top"/>
                </#if>
            </div>
            <div class="m-2">
                <span>${message.text}</span><br/>
                <i>#${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                <#if message.author??>
                    <a href="/user-messages/${message.author.id}">${message.author.getUsername()}</a>
                    <#if message.author.id == currentUserId>
                        <a class="btn btn-primary"
                           href="/user-messages/${message.author.id}?message=${message.id}">Edit</a>
                    </#if>
                <#else>
                    <strong>&#60;none&#62;</strong>
                </#if>
            </div>

        </div>
    <#else>
        No message
    </#list>
</div>
<@p.pager url page />