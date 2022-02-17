<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="jsGrid1" class="jsgrid" style="position: relative; height: 100%; width: 100%;">
    <div class="jsgrid-grid-header jsgrid-header-scrollbar">
        <table class="jsgrid-table">
            <tr class="jsgrid-header-row">
                <th class="jsgrid-header-cell jsgrid-header-sortable jsgrid-header-sort jsgrid-header-sort-desc"
                    style="width: 150px;">Name</th>
                <th class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable" style="width: 50px;">Age</th>
                <th class="jsgrid-header-cell jsgrid-header-sortable" style="width: 200px;">Address</th>
                <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 100px;">Country
                </th>
                <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 100px;">Is
                    Married</th>
            </tr>
            <tr class="jsgrid-filter-row" style="display: none;">
                <td class="jsgrid-cell" style="width: 150px;"><input type="text"></td>
                <td class="jsgrid-cell jsgrid-align-right" style="width: 50px;"><input type="number"></td>
                <td class="jsgrid-cell" style="width: 200px;"><input type="text"></td>
                <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;"><select>
                        <option value="0"></option>
                        <option value="1">United States</option>
                        <option value="2">Canada</option>
                        <option value="3">United Kingdom</option>
                        <option value="4">France</option>
                        <option value="5">Brazil</option>
                        <option value="6">China</option>
                        <option value="7">Russia</option>
                    </select></td>
                <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;"><input type="checkbox" readonly="">
                </td>
            </tr>
            <tr class="jsgrid-insert-row" style="display: none;">
                <td class="jsgrid-cell" style="width: 150px;"><input type="text"></td>
                <td class="jsgrid-cell jsgrid-align-right" style="width: 50px;"><input type="number"></td>
                <td class="jsgrid-cell" style="width: 200px;"><input type="text"></td>
                <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;"><select>
                        <option value="0"></option>
                        <option value="1">United States</option>
                        <option value="2">Canada</option>
                        <option value="3">United Kingdom</option>
                        <option value="4">France</option>
                        <option value="5">Brazil</option>
                        <option value="6">China</option>
                        <option value="7">Russia</option>
                    </select></td>
                <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;"><input type="checkbox"></td>
            </tr>
        </table>
    </div>
    <div class="jsgrid-grid-body" style="height: 821px;">
        <table class="jsgrid-table">
            <tbody>
                <tr class="jsgrid-row">
                    <td class="jsgrid-cell" style="width: 150px;">Zachery Atkins</td>
                    <td class="jsgrid-cell jsgrid-align-right" style="width: 50px;">30</td>
                    <td class="jsgrid-cell" style="width: 200px;">549-2208 Auctor. Road</td>
                    <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">United States</td>
                    <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;"><input type="checkbox"
                            disabled=""></td>
                </tr>
                <tr class="jsgrid-alt-row">
                    <td class="jsgrid-cell" style="width: 150px;">Xena Wilkerson</td>
                    <td class="jsgrid-cell jsgrid-align-right" style="width: 50px;">63</td>
                    <td class="jsgrid-cell" style="width: 200px;">Ap #303-6974 Proin Street</td>
                    <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">United States</td>
                    <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;"><input type="checkbox"
                            disabled=""></td>
                </tr>

            </tbody>
        </table>
    </div>
    <div class="jsgrid-pager-container">
        <div class="jsgrid-pager">Pages: <span class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a
                    href="javascript:void(0);">First</a></span> <span
                class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a
                    href="javascript:void(0);">Prev</a></span> <span
                class="jsgrid-pager-page jsgrid-pager-current-page">1</span><span class="jsgrid-pager-page"><a
                    href="javascript:void(0);">2</a></span><span class="jsgrid-pager-page"><a
                    href="javascript:void(0);">3</a></span><span class="jsgrid-pager-page"><a
                    href="javascript:void(0);">4</a></span><span class="jsgrid-pager-page"><a
                    href="javascript:void(0);">5</a></span> <span class="jsgrid-pager-nav-button"><a
                    href="javascript:void(0);">Next</a></span> <span class="jsgrid-pager-nav-button"><a
                    href="javascript:void(0);">Last</a></span> &nbsp;&nbsp; 1 of 5 </div>
    </div>
    <div class="jsgrid-load-shader" style="display: none; position: absolute; inset: 0px; z-index: 1000;"></div>
    <div class="jsgrid-load-panel" style="display: none; position: absolute; top: 50%; left: 50%; z-index: 1000;">
        Please, wait...</div>
</div>




<script src="../../plugins/jquery/jquery.min.js"></script>

<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="../../plugins/jsgrid/demos/db.js"></script>
<script src="../../plugins/jsgrid/jsgrid.min.js"></script>

<script src="../../dist/js/adminlte.min.js?v=3.2.0"></script>

<script src="../../dist/js/demo.js"></script>

<script>
  $(function () {
    $("#jsGrid1").jsGrid({
        height: "100%",
        width: "100%",

        sorting: true,
        paging: true,

        data: db.clients,

        fields: [
            { name: "Name", type: "text", width: 150 },
            { name: "Age", type: "number", width: 50 },
            { name: "Address", type: "text", width: 200 },
            { name: "Country", type: "select", items: db.countries, valueField: "Id", textField: "Name" },
            { name: "Married", type: "checkbox", title: "Is Married" }
        ]
    });
  });
</script>

</body>
</html>