<#import "parts/common.ftlh" as c>

<@c.page>
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
