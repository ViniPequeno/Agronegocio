<script src="../Bootstrap/js/jquery-3.2.1.min.js"></script>
<script src="../Bootstrap/js/popper.min.js"></script>
<script src="../Bootstrap/js/bootstrap.js"></script>
<script src="../Bootstrap/js/mdb.js"></script>
<script src="../js/jquery.mask.js"></script>
<script src="../js/jspdf.min.js"></script>
<script>
// Tooltips Initialization
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
    //Inicializa tooltips de botões modal
    $(function () {
        $('[data-tooltip="true"]').tooltip();
    });
    function goBack() {
        window.history.back();
    }
</script>