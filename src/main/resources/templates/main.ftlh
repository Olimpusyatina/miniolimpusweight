<#import "parts/common.ftlh" as c>

<@c.page>
    <form action="/addData" method="post" xmlns="http://www.w3.org/1999/html">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Время</label>
            <div class="col-sm-6">
                <input type="text" name="startDate" id="startDate" class="form-control">
<#--                       <#if startDate??>value="${startDate}"<#else> </#if>>-->
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Время</label>
            <div class="col-sm-6">
                <input type="text" name="endDate" id="endDate" class="form-control">
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
    <script>
            const date = new Date();
            let hours = date.getHours();
            let minutes = date.getMinutes();
            if (hours < 10) hours = "0" + hours;
            if (minutes < 10) minutes = "0" + minutes;
            document.getElementById("startDate").value = hours + ":" + minutes;
            hours = date.getHours() + 1;
            if (hours > 23) hours = hours - 24;
            if (hours < 10) hours = "0" + hours;
            document.getElementById("endDate").value = hours + ":" + minutes;

    </script>
</@c.page>
