<#import "parts/common.ftlh" as c>

<@c.page>
    <form action="/addData" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Время</label>
            <div class="col-sm-6">
                <input type="text" name="startDate" class="form-control" placeholder="Время начала"
                       <#if startDate??>value="${startDate}"<#else> </#if>>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Время</label>
            <div class="col-sm-6">
                <input type="text" name="endDate" class="form-control" placeholder="Время конца"
                       <#if endDate??>value="${endDate}"<#else> </#if>>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Начальный вес</label>
            <div class="col-sm-6">
                <input type="number" name="startWeight" class="form-control" placeholder="Начальный вес" step="0.1"
                        <#if startWeight??>
                            value="${startWeight}"
                        <#else >
                        </#if>
                >
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Конечный вес</label>
            <div class="col-sm-6">
                <input type="number" name="endWeight" class="form-control" placeholder="Конечный вес" step="0.1"
                        <#if endWeight??>
                            value="${endWeight}"
                        <#else >
                        </#if>
                >
            </div>
        </div>
        <#list things as thing>
            <div class="form-check">
                <input class="form-check-input" name = "selectedThings" value ="${thing.thingmame}" type="checkbox" <#if thing.def> checked </#if>">
                <label class="form-check-label" for="defaultCheck1">
                    ${thing.thingmame}
                </label>
            </div>
        </#list>
        <div class="container mt-5"></div>
        <button class="btn btn-primary" type="submit">Добавить</button>
    </form>
    <#if answer??>
        <label>${answer}</label>
    <#else>
    </#if>
</@c.page>
