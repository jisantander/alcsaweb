namespace CobranzaALC.Dto
{
    using System;

    public class CabezaCuotaColegio
    {
        private string cli;
        private string deudor;
        private string nro_operacion;
        private string producto;

        public string Cli
        {
            get
            {
                return this.cli;
            }
            set
            {
                this.cli = value;
            }
        }

        public string Deudor
        {
            get
            {
                return this.deudor;
            }
            set
            {
                this.deudor = value;
            }
        }

        public string Nro_Operacion
        {
            get
            {
                return this.nro_operacion;
            }
            set
            {
                this.nro_operacion = value;
            }
        }

        public string Producto
        {
            get
            {
                return this.producto;
            }
            set
            {
                this.producto = value;
            }
        }
    }
}

