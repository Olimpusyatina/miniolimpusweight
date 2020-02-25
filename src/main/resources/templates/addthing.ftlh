<#import "parts/common.ftlh" as c>

<@c.page>
    <table class="table  table-striped">
        <caption>Список вещей</caption>
        <thead class="thead-dark">
        <tr>
<#--            <th scope="col">№</th>-->
            <th scope="col">Название</th>
            <th scope="col">Вес</th>
            <th scope="col">По умолчанию</th>
        </tr>
        </thead>
        <tbody>
        <#list things as thing>
            <tr>
<#--                <th scope="row"></th>-->
<#--                <td><#if weight.date??>${weight.date}<#else >Неизвестно</#if></td>-->
                <td>${thing.thingmame}</td>
                <td> <#if thing.weight=0>Неизвестно<#else>v</#if></td>
                <td> <#if thing.def>Да<#else>Нет</#if></td>
            </tr>
        </#list>
        </tbody>
    </table>
    <form action="/addThing" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Название</label>
            <div class="col-sm-6">
                <input type="text" name="name" class="form-control" placeholder="Что за вещь"
                       <#if name??>value="${name}"<#else> </#if>>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Вес</label>
            <div class="col-sm-6">
                <input type="text" name="weight" class="form-control" placeholder="Сколько весит?"
                       <#if weight??>value="${weight}"<#else> </#if>>
            </div>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" name ="isDefault">
            <label class="form-check-label" for="defaultCheck1">
                Изначально одеты
            </label>
        </div>
        <div class="container mt-5"/>
        <button class="btn btn-primary" type="submit">Добавить</button>
    </form>
    <#if answer??>
        <label>${answer}</label>
    <#else>
    </#if>
</@c.page>
