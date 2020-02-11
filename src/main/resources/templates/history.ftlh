<#import "parts/common.ftlh" as c>
<@c.page>
<#--    <div class="form-group row">-->
<#--        <label class="col-sm-2 col-form-label">Дата</label>-->
<#--        <label class="col-sm-2 col-form-label">Время начала</label>-->
<#--        <label class="col-sm-2 col-form-label">Начальный вес</label>-->
<#--        <label class="col-sm-2 col-form-label">Время окончания</label>-->
<#--        <label class="col-sm-2 col-form-label">Конечный вес</label>-->
<#--        <label class="col-sm-2 col-form-label">Что было одето</label>-->
<#--    </div>-->
<#--    <#list weights as weight>-->
<#--        <div class="form-group row">-->
<#--            <#if weight.date??><label class="col-sm-2 col-form-label">${weight.date}</label><#else >Неизвестно</#if>-->
<#--            <label class="col-sm-2 col-form-label">${weight.startTime}</label>-->
<#--            <label class="col-sm-2 col-form-label">${weight.startWeight}</label>-->
<#--            <label class="col-sm-2 col-form-label">${weight.endTime}</label>-->
<#--            <label class="col-sm-2 col-form-label">${weight.endWeight}</label>-->
<#--            <#list weight.things as thing>-->
<#--                <label class="col-sm-2 col-form-label">${thing.thingmame}</label>-->
<#--            </#list>-->
<#--        </div>-->
<#--    </#list>-->
    <table class="table  table-striped">
        <caption>История измерений</caption>
        <thead class="thead-dark">
        <tr>
            <th scope="col">№</th>
            <th scope="col">Дата</th>
            <th scope="col">Время начала</th>
            <th scope="col">Начальный вес</th>
            <th scope="col">Время окончания</th>
            <th scope="col">Конечный вес</th>
            <th scope="col">Что было надето</th>
        </tr>
        </thead>
        <tbody>
         <#list weights as weight>
             <tr <#if weight.endWeight - weight.startWeight < 80 >class="table-danger"</#if>>
                 <th scope="row"> ${weight?counter}</th>
                 <td><#if weight.date??>${weight.date}<#else >Неизвестно</#if></td>
                 <td>${weight.startTime}</td>
                 <td>${weight.startWeight}</td>
                 <td>${weight.endTime}</td>
                 <td>${weight.endWeight}</td>
                 <td>
                     <#list weight.things as thing>${thing.thingmame}<#sep>, </#list>
                 </td>
             </tr>
         </#list>
        </tbody>
    </table>
</@c.page>
