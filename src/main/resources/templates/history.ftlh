<#import "parts/common.ftlh" as c>
<@c.page>
<div class="table-responsive">
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
</div>
</@c.page>
