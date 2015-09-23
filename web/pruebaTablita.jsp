    <style type="text/css">
        table {
            border-collapse: collapse;
            border: none;
        }
        th,td {
            border: 1px solid black;
            padding: 4px 16px;
            font-family: Times New Roman;
            font-size: 24px;
            text-align: left;
        }
        th {
            background-color: #C8C8C8;
            cursor: pointer;
        }
        th:hover
        {
            text-decoration: underline;
        }
    </style>
    <script type="text/javascript">
        var people,
            asc1 = 1,
            asc2 = 1,
            asc3 = 1;
        window.onload = function () 
        {
            people = document.getElementById("people");
        }

        function sort_table(tbody, columna, asc) 
        {
            var filas = tbody.rows,
                filasLenght = filas.length,
                arr = new Array(),i, j, arrCeldas, arrCeldasLenght;
                
                // fill the array with values from the table
                for (i = 0; i < filasLenght; i++) 
                {
                    arrCeldas = filas[i].cells;
                    arrCeldasLenght = arrCeldas.length;
                    arr[i] = new Array();
                    for (j = 0; j < arrCeldasLenght; j++) 
                    {
                        //AGREGO ALL ARRAY EL CONTENIDO DE LA CELDA.
                        arr[i][j] = arrCeldas[j].innerHTML;
                    }
                }
            // sort the array by the specified column number (col) and order (asc)
            arr.sort(function (a, b) 
            {
                return (a[columna] == b[columna]) ? 0 : ((a[columna] > b[columna]) ? asc : -1 * asc);
            });
            // replace existing rows with new rows created from the sorted array
            for (i = 0; i < filasLenght; i++) {
                filas[i].innerHTML = "<td>" + arr[i].join("</td><td>") + "</td>";
            }
        }
    </script>
<body>
    <table>
        <thead>
            <tr>
                <th onclick="sort_table(people, 0, asc1); asc1 *= -1; asc2 = 1; asc3 = 1;">Name</th>
                <th onclick="sort_table(people, 1, asc2); asc2 *= -1; asc3 = 1; asc1 = 1;">Surname</th>
                <th onclick="sort_table(people, 2, asc3); asc3 *= -1; asc1 = 1; asc2 = 1;">Age</th>
            </tr>
        </thead>
        <tbody id="people">
            <tr>
                <td>Raja</td>
                <td>Dey</td>
                <td>18</td>
            </tr>
            <tr>
                <td>Mamata</td>
                <td>Sharma</td>
                <td>20</td>
            </tr>
            <tr>
                <td>Avijit</td>
                <td>Sharma</td>
                <td>21</td>
            </tr>
            <tr>
                <td>Sharanya</td>
                <td>Dutta</td>
                <td>26</td>
            </tr>
            <tr>
                <td>Nabin</td>
                <td>Roy</td>
                <td>27</td>
            </tr>
        </tbody>
    </table>
</body>

</html>